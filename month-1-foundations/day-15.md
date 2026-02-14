# Day 15 Morning: Fiber, Port Security, and IP Foundations

## 📖 Theory & Notes (NetworkChuck Modules)

### 1. Fiber Optics
* **Key Concept:** Total Internal Reflection allows data to travel as pulses of light through glass/plastic cores at incredible speeds.
* **Single-mode (SMF):** Small core, laser-driven, used for long distances (kilometers).
* **Multimode (MMF):** Larger core, LED-driven, used for short distances (Data Centers/Buildings).
* **Takeaway:** Fiber is the backbone of the "Cloud." Understanding LC/SC connectors is vital for physical layer troubleshooting.

### 2. Port Security (Switch Hardening)
* **Risk:** MAC Flooding and rogue devices can take down a corporate network in seconds.
* **Security Measures:** * Shutting down unused ports.
    * **Sticky MAC:** Hard-coding a specific device's MAC address to a port so no other device can connect.
    * **Violation Modes:** Shutdown (disables port), Restrict (drops packets + alerts), Protect (drops packets silently).

### 3. IP Addressing (The Logical Map)
* **Static vs. DHCP:** Static is for servers (HostelLink backend); DHCP is for clients (Students' phones).
* **Public vs. Private:** 192.168.x.x and 10.x.x.x are private "Internal" addresses. Public IPs are what the world sees.
* **Default Gateway:** The "Exit Door" of the network. Without it, you are trapped in your local subnet.

---

## 🛠️ Morning Practice: Knowledge Verifier Script
**Project:** `fiber-port-ip-verifier.sh`

### Implementation Screenshot:
> [INSERT SCREENSHOT OF YOUR SCRIPT RUNNING HERE]

### Evidence of Completion:
- **Directory:** `networking-day15/`
- **File:** `fiber-port-ip-verifier.sh`
- **Git Status:** Pushed to origin main.

---

## 💡 Connection to Career Goals
Understanding these physical and logical layers is critical for my **Smart Campus Shuttle Tracker**. 
- **Fiber:** Influences how I choose hosting for low-latency GPS data.
- **Port Security:** Necessary for securing the hardware modules installed on the shuttles.
- **IPs:** The bread and butter of connecting the shuttle's IoT device to the Cloud backend.






# Day 15 Evening: Network Infrastructure Recommendation Engine

## 🏗️ Project Overview: Decision-Support Automation
**Project Name:** `infra-recommendation.sh`  
**Objective:** Build a logic-based engine that recommends physical layer hardware (Cabling, PoE, Security) based on real-world constraints. This tool acts as a "Network Architect" in a script.

---

## 📝 Pseudocode (Design Logic)
```bash
# 1. Capture user inputs: Distance, Speed, PoE requirements, and Security level.
# 2. Logic: If distance > 100m, automatically flag Copper as invalid and suggest Fiber.
# 3. Fiber Logic: Differentiate between Single-mode (long distance) and Multimode (short/campus).
# 4. PoE Logic: Map wattage to standards (802.3af/at/bt).
# 5. Security Logic: Map levels to Switch Port Security modes (Shutdown/Sticky MAC).
# 6. Conflict Detection: Flag if user asks for PoE over Fiber (Physical impossibility).
# 7. Reporting: Export final architectural recommendation to a timestamped .txt file.
