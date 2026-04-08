#!/bin/bash

# IAM Security Auditor
# Author: Niyhi
# Date: April 8, 2026

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables
REPORT_FILE="iam-audit-report-$(date +%Y%m%d-%H%M%S).txt"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text 2>/dev/null)

if [ -z "$ACCOUNT_ID" ]; then
    echo "Error: AWS CLI not configured or credentials expired"
    exit 1
fi

echo "═══════════════════════════════════════" | tee $REPORT_FILE
echo "IAM SECURITY AUDIT REPORT" | tee -a $REPORT_FILE
echo "Generated: $(date)" | tee -a $REPORT_FILE
echo "Account ID: $ACCOUNT_ID" | tee -a $REPORT_FILE
echo "═══════════════════════════════════════" | tee -a $REPORT_FILE
echo "" | tee -a $REPORT_FILE

# Function 1: Check root account security
check_root_security() {
    echo "✅ ROOT ACCOUNT SECURITY" | tee -a $REPORT_FILE
    
    SUMMARY=$(aws iam get-account-summary 2>/dev/null)
    
    if [ -z "$SUMMARY" ]; then
        echo "  Error: Could not get account summary" | tee -a $REPORT_FILE
        return
    fi
    
    ROOT_MFA=$(echo "$SUMMARY" | jq -r '.SummaryMap.AccountMFAEnabled')
    ROOT_KEYS=$(echo "$SUMMARY" | jq -r '.SummaryMap.AccountAccessKeysPresent')
    
    if [ "$ROOT_MFA" == "1" ]; then
        echo -e "  ${GREEN}[✓]${NC} Root MFA enabled" | tee -a $REPORT_FILE
    else
        echo -e "  ${RED}[✗]${NC} Root MFA NOT enabled ← CRITICAL RISK!" | tee -a $REPORT_FILE
    fi
    
    if [ "$ROOT_KEYS" == "0" ]; then
        echo -e "  ${GREEN}[✓]${NC} No root access keys found" | tee -a $REPORT_FILE
    else
        echo -e "  ${RED}[✗]${NC} Root access keys exist ← DELETE IMMEDIATELY!" | tee -a $REPORT_FILE
    fi
    
    echo "" | tee -a $REPORT_FILE
}

# Function 2: Check MFA for all users
check_user_mfa() {
    echo "⚠️  MFA STATUS" | tee -a $REPORT_FILE
    
    USERS=$(aws iam list-users --query 'Users[].UserName' --output text 2>/dev/null)
    
    if [ -z "$USERS" ]; then
        echo "  No IAM users found or error listing users" | tee -a $REPORT_FILE
        echo "" | tee -a $REPORT_FILE
        return
    fi
    
    USER_COUNT=0
    NO_MFA_COUNT=0
    
    for USER in $USERS; do
        ((USER_COUNT++))
        MFA_DEVICES=$(aws iam list-mfa-devices --user-name "$USER" --query 'MFADevices' --output json 2>/dev/null)
        MFA_COUNT=$(echo "$MFA_DEVICES" | jq 'length' 2>/dev/null)
        
        if [ -z "$MFA_COUNT" ] || [ "$MFA_COUNT" == "null" ]; then
            MFA_COUNT=0
        fi
        
        if [ "$MFA_COUNT" -eq 0 ]; then
            echo -e "  ${RED}[✗]${NC} $USER: MFA NOT enabled ← RISK!" | tee -a $REPORT_FILE
            ((NO_MFA_COUNT++))
        else
            echo -e "  ${GREEN}[✓]${NC} $USER: MFA enabled" | tee -a $REPORT_FILE
        fi
    done
    
    echo "  Total users checked: $USER_COUNT" | tee -a $REPORT_FILE
    echo "" | tee -a $REPORT_FILE
}

# Function 3: Check users with admin access
check_admin_users() {
    echo "⚠️  ADMINISTRATOR ACCESS" | tee -a $REPORT_FILE
    
    USERS=$(aws iam list-users --query 'Users[].UserName' --output text 2>/dev/null)
    
    if [ -z "$USERS" ]; then
        echo "  No users to check" | tee -a $REPORT_FILE
        echo "" | tee -a $REPORT_FILE
        return
    fi
    
    ADMIN_COUNT=0
    
    for USER in $USERS; do
        POLICIES=$(aws iam list-attached-user-policies --user-name "$USER" --query 'AttachedPolicies[?PolicyName==`AdministratorAccess`]' --output json 2>/dev/null)
        
        if [ -z "$POLICIES" ]; then
            continue
        fi
        
        POLICY_COUNT=$(echo "$POLICIES" | jq 'length' 2>/dev/null)
        
        if [ ! -z "$POLICY_COUNT" ] && [ "$POLICY_COUNT" != "null" ] && [ "$POLICY_COUNT" -gt 0 ]; then
            echo -e "  ${YELLOW}[!]${NC} $USER has AdministratorAccess" | tee -a $REPORT_FILE
            ((ADMIN_COUNT++))
        fi
    done
    
    if [ $ADMIN_COUNT -eq 0 ]; then
        echo "  No users with direct AdministratorAccess policy attached" | tee -a $REPORT_FILE
    else
        echo "  Total users with admin access: $ADMIN_COUNT" | tee -a $REPORT_FILE
    fi
    
    echo "" | tee -a $REPORT_FILE
}

# Main execution
echo ""
echo "Starting IAM Security Audit..."
echo ""

check_root_security
check_user_mfa
check_admin_users

echo "═══════════════════════════════════════" | tee -a $REPORT_FILE
echo "AUDIT COMPLETE" | tee -a $REPORT_FILE
echo "Report saved to: $REPORT_FILE" | tee -a $REPORT_FILE
echo "═══════════════════════════════════════" | tee -a $REPORT_FILE

cat $REPORT_FILE
