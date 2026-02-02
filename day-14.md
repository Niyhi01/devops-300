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
