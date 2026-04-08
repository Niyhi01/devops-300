# Day 1 Reflection - April 8, 2026

## 1. What's the difference between IAM users, roles, and policies?

**Users:** Identities for people (username + password or access keys)
**Roles:** Identities for AWS services or temporary access (no permanent credentials)
**Policies:** JSON documents that define what actions are allowed or denied

Example: User "niyhi-admin" has a Policy "AdministratorAccess" attached. A Role "EC2-S3-Access" allows EC2 instances to access S3 buckets.

## 2. Why is root MFA critical? What could happen if root is compromised?

Root account has UNRESTRICTED access to everything in AWS. If compromised:
- Attacker can delete all resources
- Spin up expensive EC2 instances (huge bills)
- Steal data from S3 buckets
- Delete backups and security logs
- Lock you out of your own account

MFA adds second layer - even if password is stolen, attacker needs the MFA device.

## 3. What's the "principle of least privilege" and why does it matter?

Give users ONLY the permissions they need to do their job, nothing more.

Example: Developer needs EC2 and S3 access for their app. Don't give them AdministratorAccess.

Why it matters:
- If their account is compromised, damage is limited
- Reduces accidental deletions (can't delete what you don't have access to)
- Better security compliance

## 4. What was the hardest part of today's work?

**53 days ago:** Understanding AWS CLI JSON output and parsing with jq
**Today (resuming):** Getting back into the mindset after being away. Had to re-familiarize with AWS CLI commands.

The script itself wasn't too hard once I understood the pattern: list resources → check conditions → report findings.

## 5. How would you improve this script for production use with 100+ users?

1. **Email alerts:** Send report to security team automatically
2. **Scheduled execution:** Run via cron daily/weekly
3. **Additional checks:**
   - Password age (flag passwords older than 90 days)
   - Unused access keys (last used > 90 days)
   - Inactive users (no login in 6+ months)
4. **JSON output:** For integration with monitoring tools
5. **Parallel processing:** Check users in batches for faster execution
6. **Historical tracking:** Compare reports over time to detect changes

## Ownership Statement

I wrote 100% of this script myself. I understood the logic behind each function:
- How to check root account summary
- How to iterate through users
- How to parse JSON with jq
- How to generate formatted reports

I stopped on Feb 14 and resumed April 8. I'm committed to finishing this time.

## Lessons from 53-Day Gap

**What I learned about myself:**
- I struggle with consistency when there's no immediate pressure
- I need to treat this like a job, not a hobby
- Survival concerns (food, money) derail me easily
- But I WANT this - coming back proves that

**Moving forward:**
- Daily check-ins even on hard days
- Focus on completing tasks, not perfection
- Build momentum through small wins
