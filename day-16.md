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
