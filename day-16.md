# Day 16 Morning: Conquering the Subnetting "Boss Fight"

## 📖 Theory & Final Milestone
**Status:** NetworkChuck Networking Playlist - **100% Complete** ✅

### Key Learnings from the Final Modules:
* **Subnetting Deep Dive:** The process of breaking a large network into smaller, manageable "sub-nets" to improve security and performance.
* **The Magic Number/Block Size:** Using the CIDR notation (e.g., /26) to determine the "step" between network IDs (e.g., /26 = block size of 64).
* **Usable Hosts Calculation:** Subtracting 2 (Network ID and Broadcast Address) from the total available IPs in a block ($2^n - 2$).
* **Private IP Space:** How 10.x.x.x, 172.16.x.x, and 192.168.x.x allow us to save billions of public IPv4 addresses using NAT.

---

## 🛠️ Morning Practice: Subnetting Drill Tool
**Project:** `subnet-drill.sh`  
**Goal:** Create a deliberate practice tool to convert theoretical subnetting knowledge into muscle memory.

### Evidence of Completion:
- **Directory:** `networking-day16/`
- **File:** `subnet-drill.sh`
- **Git Status:** Pushed to GitHub.

---

## 🧠 Reflection on "Weak Spots"
As I finish the networking playlist, I've identified **Subnetting** as an area where I need more hands-on practice. It's easy to watch the video, but building this script forced me to verify the math myself. 

---

## 📂 Git Commit
```bash
git add networking-day16/subnet-drill.sh day-16.md
git commit -m "feat: subnetting drill script to master networking foundations"
git push origin main





# Day 16 Evening: Month 1 Capstone - Linux Hardening & Monitoring Suite

## 🎯 Project Goal
To consolidate Month 1 (Linux, Bash, Networking, and Security) by building a production-ready automation suite that secures and monitors a server autonomously.

---

## 🏗️ Architecture & Logic
I broke the project into three distinct architectural layers:

### 1. The Perimeter (`system-hardener.sh`)
* **Logic:** Uses `sed` to modify `/etc/ssh/sshd_config`, disabling root login and password authentication. 
* **Security:** Configures `UFW` (Uncomplicated Firewall) to implement a "Default Deny" policy.
* **Automation:** Sets up `unattended-upgrades` to ensure the server patches itself against zero-day vulnerabilities.

### 2. The Watchman (`monitor-daemon.sh`)
* **Resource Tracking:** Uses `df`, `free`, and `top` to scrape system vitals.
* **Bash Math:** Implemented `bc` for floating-point calculations to monitor CPU load accurately.
* **Persistence:** Managed by a `systemd` service file to ensure it starts on boot and restarts if it fails.

### 3. The Scout (`network-mapper.sh`)
* **Reconnaissance:** Uses `nmap -sV` to fingerprint every device on the subnet.
* **Goal:** Provides a snapshot of the attack surface to identify unauthorized devices or open ports.

---

## 🚀 Evidence of Completion
* **Systemd Status:** [INSERT SCREENSHOT OF `systemctl status devops-monitor`]
* **Alert Logs:** [INSERT SCREENSHOT OF `/var/log/devops-monitor/health.log`]
* **Scan Report:** [INSERT SCREENSHOT OF `network-scan-xxx.txt`]

---

## 🧠 Final Month 1 Reflections
* **Hardest part:** Transitioning from scripts that run once to a script that runs as a system-managed service (`systemd`).
* **Key Lesson:** Security is not a one-time setup; it’s a continuous process of hardening, monitoring, and auditing.
* **Current Skill Level:** I started Day 1 struggling with basic navigation. On Day 16, I am writing automated security suites.

**Ownership Statement:** I wrote 100% of these scripts manually, focusing on understanding the underlying Linux system calls.
