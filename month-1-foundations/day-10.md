# Day 10 – Jan 17 2026

Morning:
- Watched 3 NetworkChuck episodes (Routers, TCP/IP vs OSI Model, real-life examples)
- Built: router-notes.txt + layers-diagram.txt + network-layers.sh
- Started on time. No excuses.


# Day 10 – Jan 17, 2026: Networking Deep Dive & Diagnostic Automation

## 🌅 Morning Session: Theoretical Foundations
**Focus:** Routers, Switches, and the Layered Models (OSI vs. TCP/IP).

### Key Concepts Mastered:
* **Routers vs. Switches:** * Switches operate at **Layer 2** (Data Link) and use **MAC addresses** to move frames within a local network.
    * Routers operate at **Layer 3** (Network) and use **IP addresses** to move packets between different networks.
* **The Layered Approach:**
    * The **OSI Model** (7 Layers) is our troubleshooting map.
    * The **TCP/IP Model** (4 Layers) is the real-world implementation we use on the internet.

### Morning Tasks Completed:
- [x] Created `router-notes.txt` (Summary of Layer 2 vs. Layer 3 logic).
- [x] Developed `network-layer.sh` script to display the mapping between OSI and TCP/IP.

---

## 🌑 Evening Session: Advanced Scripting & Tooling
**Focus:** Reliability, Persistence (Logging), and Flow Control.

### Technical Achievements:
1. **Enhanced `network-diagnostic.sh`:**
    * **Logging:** Integrated `tee` to output data to the terminal and a timestamped file simultaneously.
    * **Early Exit:** Added a reachability check using `ping` to prevent the script from running unnecessary commands if the target is down.
    * **Layer 7 Check:** Integrated `dig` for DNS resolution.
2. **Interactive Learning:**
    * Built `network-quiz.sh` using **Short-Circuit Evaluation** (`&&` and `||`) for rapid logic checks.
3. **Documentation:**
    * Created `layers-map.txt` and `router-switch-cheat.txt` for quick reference during AWS VPC configuration (Month 2).

### 🛠️ Commands of the Day:
| Command | What I Mastered |
| :--- | :--- |
| `tee` | Splitting output to screen and file. |
| `$(date +%Y%m%d)` | Using subshells to generate dynamic timestamps. |
| `! [condition]` | Negation logic in Bash (If NOT success, then...). |
| `dig +short` | Querying DNS servers for specific A records. |

---

## 🏁 Proof of Completion
* **GitHub Commit:** [Insert your link here]
* **Daily Status:** Morning Block (Accepted) | Evening Block (Complete)
* **Streak:** 10 Days. No excuses.
