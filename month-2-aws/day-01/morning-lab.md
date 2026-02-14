
# Month 2, Day 1: IAM Morning Lab

## Morning Learning (6:00-6:30 AM)

### Video Watched
- AWS IAM Tutorial - TechWorld with Nana (30 minutes at 1.5x speed)
- Link: https://www.youtube.com/watch?v=_ZCTvmaPgao

### Key Takeaways
1. **IAM controls access to AWS resources** - It's the service that manages who can access what in your AWS account
2. **Authorization depends on policies** - Policies are JSON documents that define what actions are allowed or denied
3. **Access keys are credentials for CLI/API** - Access Key ID + Secret Access Key are used to interact with AWS programmatically
4. **Root account must be protected at all cost** - It's the most powerful account with unrestricted access to everything

### Understanding Gained
- Difference between authentication (who you are) vs authorization (what you can do)
- IAM users, groups, roles, and policies work together to control access
- Principle of least privilege - give minimum permissions needed
- MFA adds critical second layer of security

---

## Tasks Completed

### 1. Root MFA Enabled
- Enabled MFA on root account using Google Authenticator
- Screenshot: located screenshot folder

### 2. IAM Admin User Created
- Username: niyhi-admin
- Permissions: AdministratorAccess
- Console access: Enabled
- Screenshot: User created ✅

### 3. Access Keys Created
- Created access keys for CLI access
- Keys downloaded and secured
- Access Key ID: AKIATHVQK3PHVOFYQDFB
- Screenshot: Access keys created ✅

### 4. IAM Groups Created (3 groups)
- **Admins**: AdministratorAccess policy
- **Developers**: AmazonEC2FullAccess, AmazonS3FullAccess
- **ReadOnly**: ReadOnlyAccess policy
- Screenshot: Groups page showing all 3 groups ✅

### 5. Signed in as IAM User
- Logged out of root account
- Logged in as niyhi-admin
- Verified console access
- Screenshot: Console showing niyhi-admin ✅

### 6. AWS CLI Configured
- Installed: aws-cli/2.33.22
- Configured with niyhi-admin credentials
- Region: us-east-1
- Output format: json

### CLI Test Results
```bash
aws sts get-caller-identity
# Result: Confirmed identity as niyhi-admin
# Account: 222634367951
# ARN: arn:aws:iam::222634367951:user/niyhi-admin

aws iam list-users
# Result: Listed 1 user (niyhi-admin)
# Created: 2026-02-14
```

## Issues Faced
- Initial AWS CLI installation via apt failed
- Solution: Used snap install with --classic flag
- Worked perfectly after that

## Key Learnings
1. IAM users are separate from root - much safer for daily use
2. Access keys enable CLI/API access
3. Groups make permission management easier
4. MFA is critical for account security
5. Always use IAM user, never root for regular work
