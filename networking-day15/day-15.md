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
