━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📅 MONTH 2 - DAY 1 | AWS IAM Mastery
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 TODAY'S GOAL
By tonight, you'll understand AWS identity management and have a working IAM security audit tool.

💰 COST TODAY: ₦0 (IAM is 100% FREE forever)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⏰ MORNING (6:00-7:30 AM) - Due 7:30 AM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

LEARN (30 min) - 6:00-6:30 AM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Watch at 1.5x speed:
→ AWS IAM Tutorial - TechWorld with Nana (30 min)
  https://www.youtube.com/watch?v=_ZCTvmaPgao

Focus on understanding:
• What is IAM? (Identity and Access Management)
• Users vs Groups vs Roles vs Policies
• IAM Policy structure (JSON format)
• MFA (Multi-Factor Authentication)
• Access keys vs passwords
• Least privilege principle
• Root user vs IAM users

REPORT HERE by 6:30 AM with 3 key takeaways:
"Day 1 morning complete:
1. [First key learning]
2. [Second key learning]
3. [Third key learning]"

BUILD (60 min) - 6:30-7:30 AM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

LAB 1: IAM Admin User Setup (Don't use root!)
□ Log into AWS Console as root user
□ Enable MFA on root account:
  - Top right → Security credentials
  - MFA section → Activate MFA
  - Use Google Authenticator or Authy app
  - Scan QR code, enter 2 codes
  - Screenshot: MFA enabled ✅

□ Create IAM admin user:
  - IAM → Users → Create user
  - Username: niyhi-admin
  - Enable: AWS Management Console access
  - Password: Set custom password (save it!)
  - Permissions: Attach policy directly → AdministratorAccess
  - Create user
  - Screenshot: User created ✅

□ Create access keys for CLI:
  - Click on niyhi-admin user
  - Security credentials tab
  - Create access key → Choose "CLI"
  - Download .csv file (KEEP THIS SAFE!)
  - Screenshot: Access key created ✅

LAB 2: Create IAM Groups with Policies
□ Create 3 groups:
  Group 1:
  - Name: Admins
  - Policy: AdministratorAccess
  
  Group 2:
  - Name: Developers
  - Policies: AmazonEC2FullAccess, AmazonS3FullAccess
  
  Group 3:
  - Name: ReadOnly
  - Policy: ReadOnlyAccess

□ Screenshot: All 3 groups created ✅

LAB 3: Test IAM User Login
□ Sign out of root account
□ Copy IAM user sign-in URL (IAM dashboard shows it)
□ Sign in as niyhi-admin
□ Verify you can access console
□ Screenshot: Logged in as IAM user (top right shows username) ✅

LAB 4: Configure AWS CLI
□ Open terminal:
  ```bash
  aws configure
  
  # Enter when prompted:
  AWS Access Key ID: [from downloaded .csv]
  AWS Secret Access Key: [from downloaded .csv]
  Default region name: us-east-1
  Default output format: json
  ```

□ Test AWS CLI:
  ```bash
  aws iam list-users
  aws sts get-caller-identity
  ```
  
□ Screenshot: CLI commands working ✅

✅ SUBMIT by 7:30 AM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Create folder and file:
```bash
cd ~/devops-300/month-2-aws
mkdir day-01
cd day-01
nano morning-lab.md
```

In morning-lab.md, document:
• Steps you took
• All 4 screenshots (MFA, user created, access keys, groups, CLI test)
• Any issues you faced

Git commit:
```bash
cd ~/devops-300
git add month-2-aws/day-01/morning-lab.md
git commit -m "Month 2 Day 1: IAM morning lab complete"
git push origin main
```

Reply here with:
✅ Git commit link
✅ Confirmation: "Morning lab complete - logged in as IAM user, CLI configured"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⏰ EVENING (8:30-11:00 PM) - Due 11:59 PM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀 PROJECT: IAM Security Auditor

WHAT YOU'RE BUILDING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
A Bash script that scans your AWS account and identifies security issues.

REQUIREMENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Your script must check for:

□ SECURITY CHECK 1: MFA Status
  - List all IAM users
  - Check if each user has MFA enabled
  - Report: Users WITHOUT MFA (security risk!)

□ SECURITY CHECK 2: Old Passwords
  - Check password last changed date for each user
  - Flag: Passwords older than 90 days

□ SECURITY CHECK 3: Unused Access Keys
  - List all access keys for all users
  - Check last used date
  - Flag: Keys not used in 90+ days (should be deleted)

□ SECURITY CHECK 4: Overly Permissive Users
  - Check which users have AdministratorAccess policy
  - Report: Should be minimal (principle of least privilege)

□ SECURITY CHECK 5: Root Account Usage
  - Check root account access key (should NOT exist)
  - Verify root MFA is enabled

OUTPUT FORMAT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Script should generate a clean report:

```
IAM SECURITY AUDIT REPORT
Generated: 2026-02-15 09:30:45
Account ID: 222634367951
═══════════════════════════════════════

✅ ROOT ACCOUNT SECURITY
  [✓] Root MFA enabled
  [✓] No root access keys found

⚠️  MFA STATUS (2 users checked)
  [✓] niyhi-admin: MFA enabled
  [✗] test-user: MFA NOT enabled ← RISK!

⚠️  PASSWORD AGE
  [✓] niyhi-admin: 1 days old
  
⚠️  UNUSED ACCESS KEYS
  [✗] test-user: Access key not used in 120 days ← DELETE!

⚠️  ADMINISTRATOR ACCESS
  [!] 2 users with AdministratorAccess:
      - niyhi-admin (acceptable)
      - test-user (review needed)

═══════════════════════════════════════
SUMMARY:
  Total Users: 2
  Security Issues Found: 2
  Action Required: Yes

RECOMMENDATIONS:
  1. Enable MFA for test-user
  2. Delete unused access key for test-user
═══════════════════════════════════════
```

AWS CLI COMMANDS YOU'LL NEED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Explore these commands (run them in terminal to understand output):

```bash
# List all IAM users
aws iam list-users

# Get MFA devices for a user
aws iam list-mfa-devices --user-name niyhi-admin

# Get user details (includes password last used)
aws iam get-user --user-name niyhi-admin

# List access keys for a user
aws iam list-access-keys --user-name niyhi-admin

# Get access key last used info
aws iam get-access-key-last-used --access-key-id AKIAXXXXX

# List policies attached to a user
aws iam list-attached-user-policies --user-name niyhi-admin

# Get account summary (includes root account info)
aws iam get-account-summary

# Check root account access keys
aws iam get-account-summary | grep "AccountAccessKeysPresent"
```

SCRIPT STRUCTURE HINTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

```bash
#!/bin/bash

# Variables
REPORT_FILE="iam-audit-report-$(date +%Y%m%d-%H%M%S).txt"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# Function: Check root MFA
check_root_mfa() {
    # Your code here
}

# Function: Check user MFA
check_user_mfa() {
    # Loop through users
    # Check MFA for each
}

# Function: Check old passwords
check_password_age() {
    # Your code here
}

# Function: Check unused access keys
check_unused_keys() {
    # Your code here
}

# Function: Check admin access
check_admin_users() {
    # Your code here
}

# Generate report
generate_report() {
    # Format and write to file
}

# Main execution
main() {
    echo "Starting IAM Security Audit..."
    check_root_mfa
    check_user_mfa
    check_password_age
    check_unused_keys
    check_admin_users
    generate_report
    echo "Audit complete! Report: $REPORT_FILE"
}

main
```

HINTS (Only use if stuck 30+ min)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Hint 1 - Parsing JSON:
Install jq if not installed: sudo apt install jq -y
Example: aws iam list-users | jq -r '.Users[].UserName'

Hint 2 - Date calculations:
Get current date: date +%s (seconds since epoch)
Get date from AWS: date -d "2026-02-01" +%s
Calculate difference: diff=$(( (current - old) / 86400 )) # days

Hint 3 - Checking if MFA exists:
MFA_COUNT=$(aws iam list-mfa-devices --user-name $USER | jq '.MFADevices | length')
if [ $MFA_COUNT -eq 0 ]; then
    echo "No MFA enabled"
fi

Hint 4 - Colors in terminal:
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
echo -e "${RED}Error!${NC}"

TESTING YOUR SCRIPT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Before submitting:
□ Create a test user to trigger alerts:
  ```bash
  aws iam create-user --user-name test-user
  aws iam create-access-key --user-name test-user
  # Don't enable MFA for this user
  ```

□ Run your script:
  ```bash
  chmod +x iam-audit.sh
  ./iam-audit.sh
  ```

□ Script should detect:
  - test-user has no MFA
  - test-user has new access key
  - test-user has AdministratorAccess (if you added it)

□ Clean up test user after:
  ```bash
  aws iam delete-access-key --user-name test-user --access-key-id AKIAXXXXX
  aws iam delete-user --user-name test-user
  ```

✅ SUBMIT by 11:59 PM
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Deliverables in ~/devops-300/month-2-aws/day-01/:

□ iam-audit.sh (your script)
□ iam-audit-report-TIMESTAMP.txt (script output)
□ README.md (how to run the script)
□ Screenshot: Script running
□ Screenshot: Generated report
□ day-01-reflection.md (answer questions below)

README.md should include:
```markdown
# IAM Security Auditor

## Purpose
Automated security audit tool for AWS IAM

## Prerequisites
- AWS CLI configured
- IAM user with read permissions
- jq installed (sudo apt install jq)

## Usage
```bash
chmod +x iam-audit.sh
./iam-audit.sh
```

## Output
Generates report: iam-audit-report-TIMESTAMP.txt

## What it checks
1. Root MFA status
2. User MFA status
3. Password age (90+ days)
4. Unused access keys (90+ days)
5. Users with admin access
```

REFLECTION QUESTIONS (day-01-reflection.md)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Answer these (5-10 min):

1. What's the difference between IAM users, roles, and policies?
   
2. Why is root MFA critical? What could happen if root is compromised?
   
3. What's the "principle of least privilege" and why does it matter?
   
4. What was the hardest part of today's work?
   
5. How would you improve this script for a production environment with 100+ users?

Ownership statement:
"I wrote 100% of this script myself. AI only explained AWS CLI commands after I tried them first."

GIT COMMIT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

```bash
cd ~/devops-300
git add month-2-aws/day-01/
git commit -m "Month 2 Day 1: IAM Security Auditor - Complete"
git push origin main
```

Reply here with:
✅ Git commit link
✅ Screenshot: Script output
✅ Screenshot: Generated report file
✅ Confirmation: "Day 1 complete - IAM audit tool working"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💀 PENALTY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Miss morning (7:30 AM): ₦20,000 charity or re-do
Miss evening (11:59 PM): ₦30,000 charity or re-do

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔥 TOMORROW UNLOCKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Day 2: AWS Lambda & Serverless (only if Day 1 complete)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 DAILY COST CHECK (11:30 PM)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Before final submission:
```bash
# Check today's AWS cost
# AWS Console → Billing → Cost Explorer → Daily costs

# Log it:
echo "Month 2, Day 1: ₦0 (IAM is free)" >> ~/devops-300/aws-cost-log.txt
```

Expected cost today: ₦0 ✅

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Good luck, Niyhi! This is your first real AWS day.

IAM is the foundation of EVERYTHING in AWS.
Master it today, thank yourself for 7 months.

Let's build. 🔥
