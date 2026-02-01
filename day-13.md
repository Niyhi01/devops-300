# Day 13: SOHO Networking & Hybrid Cloud

## Morning Progress (6:00 AM - 7:30 AM)
- **Theory Covered:** - Watched NetworkChuck: "Hacking your Home Network" (SOHO Security).
    - Watched NetworkChuck: "Hybrid Cloud" (On-prem vs Cloud integration).
- **Practice Task:** Built a SOHO Router Security Auditor script to check for common vulnerabilities like default passwords and weak encryption.

## SOHO Security Script Documentation
- **File:** `networking-day13/soho-security-check.sh`
- **Logic:** - Uses `if/elif` blocks to validate user input.
    - Implements defensive programming with `exit 1` for invalid entries.
    - Provides actionable recommendations based on the NetworkChuck security series.

### Reflection
The hardest part was managing the logic flow for user inputs to ensure the recommendations only appeared if the answers were correct. I learned that SOHO security isn't just about a password; it's about disabling features like Remote Management that leave the "front door" open to the public internet.

## Ownership Statement
I wrote 100% of the script myself this morning during the practice block.
