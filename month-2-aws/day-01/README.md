# IAM Security Auditor

## Purpose
Automated security audit tool for AWS IAM accounts.

## Author
Niyhi - Cloud DevOps Engineer
Date: April 8, 2026

## Prerequisites
- AWS CLI configured
- IAM user with read permissions
- jq installed: `sudo apt install jq -y`

## Usage
```bash
chmod +x iam-audit.sh
./iam-audit.sh
```

## Output
Generates timestamped report: `iam-audit-report-YYYYMMDD-HHMMSS.txt`

## Security Checks Performed

### 1. Root Account Security ✅
- Verifies root MFA is enabled
- Checks for root access keys (should not exist)

### 2. User MFA Status ⚠️
- Lists all IAM users
- Identifies users without MFA enabled
- Flags security risks

### 3. Administrator Access ⚠️
- Identifies users with AdministratorAccess policy
- Helps enforce principle of least privilege

## Sample Output



## Improvements for Production
- Add email notifications for security issues
- Schedule via cron for regular audits
- Check password age (90+ day policy)
- Check unused access keys
- Export to JSON for automation

## Skills Demonstrated
- AWS CLI automation
- Bash scripting
- JSON parsing with jq
- Security auditing
- Error handling
