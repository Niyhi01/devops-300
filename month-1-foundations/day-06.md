Day 6: Linux System Administration & Security
1. Task Completion List
[x] Custom systemd service created and enabled

[x] Cron jobs for system info and backups configured

[x] System log analysis with journalctl

[x] SSH hardening (Password Auth disabled)

[x] Nginx installation and custom landing page

[x] Storage management (Loop device mounting)

[x] Network connection auditing

2. Key Commands & Output Snippets
Task 1: Systemd Service
Command: sudo systemctl status hello.service Output:

Plaintext

● hello.service - My Hello Service
     Loaded: loaded (/etc/systemd/system/hello.service; enabled; vendor preset: enabled)
     Active: active (running) since ...
     Main PID: 1234 (bash)
Task 2: Cron Jobs
Command: crontab -l Output:

Plaintext

*/5 * * * * /home/niyhi/sysinfo.sh >> /home/niyhi/server-log.txt
0 2 * * * tar -czf /home/niyhi/backup-$(date +\%F).tar.gz /home/niyhi/devops-practice
Task 3: Journalctl
Command: journalctl -u ssh -f (Follow SSH logs) Note: Used this to monitor authentication attempts in real-time.

Task 4: SSH Hardening
Configuration Change: Set PasswordAuthentication no in /etc/ssh/sshd_config. Verification: Attempted password login from another terminal; received Permission denied (publickey).

Task 5: Nginx Setup
Command: curl -I localhost Output:

Plaintext

HTTP/1.1 200 OK
Server: nginx/1.18.0 (Ubuntu)
...
Task 6: Storage Check
Command: df -h /mnt/mytest Output:

Plaintext

Filesystem      Size  Used Avail Use% Mounted on
/dev/loop0       93M  1.6M   85M   2% /mnt/mytest
Task 7: Network Connections
Command: sudo ss -lptn 'sport = :80' Output:

Plaintext

LISTEN    0    511    0.0.0.0:80    0.0.0.0:* users:(("nginx",pid=123,fd=6))
I completed Day 6. No excuses.
