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



# Day 13 Evening: Home Network Port Scanner & Alert Tool

## Project Overview: Home-Port-Scanner v1
Tonight's mission was to move beyond checklists and perform active network reconnaissance. I built a script that probes my SOHO router for dangerous open ports using `nc` (Netcat), evaluates the risk level, and generates a timestamped security report.

## Reflection Questions

### 1. Hardest part and why?
The hardest part was ensuring the loop correctly incremented the count while simultaneously piping output to both the terminal and the report file using 'tee'.

### 2. Why is open port 445 dangerous on a home router?
Port 445 is for SMB (Server Message Block). If exposed to the internet, it allows attackers to attempt unauthorized file access or deploy exploits like EternalBlue. It essentially turns a private file share into a public target.

### 3. What would you add next (e.g., email alert)?
I would add a 'mail' command or a Discord Webhook integration to send an immediate notification to my phone if a High Risk port is detected during an automated cron job.

## Ownership Statement
I wrote 100% of the script myself without AI generating full blocks. I manually debugged the loop and the conditional risk-level logic.

## Evidence
- **Script:** `networking-day13/home-port-scanner.sh`
- **Report Generated:** [Insert your filename here, e.g., port-scan-report-20260202.txt]
