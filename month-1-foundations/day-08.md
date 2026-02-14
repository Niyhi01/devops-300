# Day 8: Linux Server Integration Task

## 1. Custom Monitoring Service
- **Task:** Created `monitor.service` to run `health.sh` every 60 seconds.
- **Command:** `systemctl status monitor.service`
- **Output:** Active (running) with `sleep 60` in CGroup.

## 2. Cron + Logging
- **Task:** Automated `df -h` every 10 minutes.
- **Log Location:** `~/disk-usage.log`
- **Crontab Entry:** `*/10 * * * * echo "$(date)" >> ~/disk-usage.log && df -h / >> ~/disk-usage.log`

## 3. Journalctl Analysis
- **Task:** Analyzed logs for errors and counts.
- **Key Discovery:** Found "ResstartSec" typo and "start-limit-hit" error; fixed by resetting failed state.
- **Warning Count:** `journalctl -u monitor.service | grep -c "warning"`

## 4. SSH Key Auth
- **Task:** Generated ED25519 keys and enabled passwordless login.
- **Verification:** Successfully logged into `localhost` without a password prompt.

## 5. Nginx Reverse Proxy
- **Task:** Proxied port 80 to Python server on port 8080.
- **Verification:** `curl localhost` returned the Python directory listing.

## 6. User Audit Script
- **Task:** Created `user-audit.sh` to parse `/etc/passwd`.
- **Output:** Saved to `~/user-report.txt`.

## 7. Device & Storage
- **Task:** Created 50MB loop device.
- **Mount Point:** `/mnt/test-storage` (formatted as ext4).
- **Command:** `df -h | grep test-storage`

---
I completed Day 8. No excuses.
