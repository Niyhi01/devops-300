# Day 14: Physical Layer - Ethernet & PoE

## Morning Progress (6:00 AM - 7:30 AM)
- **Theory Covered:** - Watched NetworkChuck: "Ethernet Cables - Making & Understanding" (Physical layer signaling, standards, and crimping).
    - Watched NetworkChuck: "Power over Ethernet (PoE)" (802.3 standards and power delivery).
- **Practice Task:** Built an interactive Bash script (`ethernet-poe-verifier.sh`) to test knowledge on wiring standards and PoE wattage.

## Physical Layer Technical Notes

### Ethernet Standards & Wiring
- **Twisted Pair:** Used to cancel out electromagnetic interference (crosstalk).
- **T568B Standard:** The most common wiring order (Orange-White, Orange, Green-White, Blue, Blue-White, Green, Brown-White, Brown).
- **Speed Tiers:**
    - 10BASE-T (10 Mbps)
    - 100BASE-TX (Fast Ethernet - 100 Mbps)
    - 1000BASE-T (Gigabit Ethernet - 1 Gbps)



### Power over Ethernet (PoE)
| Standard | Name | Max Power | Typical Use |
| :--- | :--- | :--- | :--- |
| **802.3af** | PoE | 15.4W | VoIP Phones, basic cameras |
| **802.3at** | PoE+ | 30W | PTZ Cameras, WiFi 6 APs |
| **802.3bt** | PoE++ | 60W - 100W | High-end IoT, Thin Clients |



## Morning Practice Documentation
- **File:** `networking-day14/ethernet-poe-verifier.sh`
- **Script Logic:** - Initializes a `SCORE` variable.
    - Uses `read` to capture user input for technical questions.
    - Implements arithmetic expansion `((SCORE++))` for correct answers.
    - Validates knowledge of the T568B pinout and 802.3at power limits.

## Reflection
Understanding the physical layer is critical for on-premise DevOps. If the cable is Cat5 instead of Cat5e, no amount of software optimization will get you to Gigabit speeds. Learning the difference between Active and Passive PoE is also a safety essential to avoid frying hardware.

## Ownership Statement
"I wrote 100% of the script myself this morning during the practice block. I manually structured the quiz logic and the scoring system."




# Day 14 Evening: Integrated Network Diagnostic Dashboard

## Project Summary: Network Dashboard v1
The goal of this project was to move away from running individual scripts manually. I built a "Master Wrapper" script that executes the entire week's worth of networking tools and compiles their output into a single, shareable HTML report. This simulates a real-world monitoring dashboard used by DevOps teams to check system health at a glance.

## Technical Implementation
- **Integration Strategy:** Used a Bash Array to store paths for scripts from Day 9 through Day 13.
- **Reporting:** Generated a dynamic HTML file using "Here Documents" and redirection.
- **Formatting:** Used `<pre>` tags and basic CSS styling to ensure terminal output remains readable and looks professional in a web browser.
- **Error Handling:** Included `2>&1` to capture both standard output and error messages into the dashboard for easier troubleshooting.

## Reflection Questions

### 1. Hardest part and why?
The hardest part was managing the logic flow within the HTML generation. Initially, I tried to run the loop inside a subshell within a `cat` command (Inception bug), which made variable management difficult. Separating the Header, Loop, and Footer into distinct blocks made the script much more stable and readable.

### 2. Why is a single HTML report better than separate text files?
In a production environment, a single HTML report is superior because it provides a centralized view of the entire stack. Stakeholders or senior engineers can open one file in a browser and see the status of DNS, connectivity, and security without navigating a complex directory structure.

### 3. What would you add next?
I would add color-coding for risks (e.g., using `sed` to wrap the word "Risk" in a red `<span>` tag) and perhaps a navigation sidebar if the report grows any larger. I would also automate the delivery of this report via an email tool like `mailx` or a Slack Webhook.

## Ownership Statement
"I wrote 100% of the script myself without AI generating full blocks. I integrated my own work from the past 6 days into this unified tool."
