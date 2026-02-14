#!/bin/bash

# --- Network Infrastructure Recommendation Engine v1 ---

echo "--- Network Infrastructure Recommendation Engine v1 ---"

# 1. User Inputs
read -p "Required distance (meters): " DIST
read -p "Required speed (10/100/1000 Mbps): " SPEED
read -p "PoE needed? (yes/no): " POE_REQ

POE_WATTS=0
if [[ "$POE_REQ" == "yes" ]]; then
    read -p "Required watts: " POE_WATTS
fi

read -p "Security level needed (basic/medium/high): " SEC_LEVEL

# 2. Logic Engines
WARNINGS=""

# Cable Selection Logic
if (( $(echo "$DIST > 100" | bc -l) )); then
    CABLE="Fiber Optic (SMF for long-haul, MMF for <500m)"
    [[ "$POE_REQ" == "yes" ]] && WARNINGS+="[!] Distance exceeds 100m copper limit. Fiber cannot carry PoE.\n"
elif [ "$SPEED" -ge 1000 ]; then
    CABLE="Cat6"
else
    CABLE="Cat5e"
fi

# PoE Standard Logic
if [[ "$POE_REQ" == "no" ]]; then
    POE_STD="None"
elif (( $(echo "$POE_WATTS <= 15.4" | bc -l) )); then
    POE_STD="802.3af (PoE)"
elif (( $(echo "$POE_WATTS <= 30.0" | bc -l) )); then
    POE_STD="802.3at (PoE+)"
else
    POE_STD="802.3bt (PoE++)"
    [[ "$CABLE" == "Cat5e" ]] && WARNINGS+="[!] CRITICAL: Cat5e + PoE++ = high risk of heat failure.\n"
fi

# Security Logic
case $SEC_LEVEL in
    basic)  SEC_REC="Strong WPA3 passwords and local admin lockdown." ;;
    medium) SEC_REC="VLAN segmentation (Guest/Staff) and MAC Filtering." ;;
    high)   SEC_REC="802.1X Port Auth (RADIUS) and Sticky MAC Port Security." ;;
    *)      SEC_REC="Standard security protocols." ;;
esac

# 3. Report Generation
FILENAME="infra-recommendation-$(date +%Y%m%d).txt"

{
    echo "=========================================="
    echo "  NETWORK RECOMMENDATION REPORT"
    echo "  Generated: $(date)"
    echo "=========================================="
    echo "INPUTS:"
    echo "- Distance: $DIST m"
    echo "- Speed: $SPEED Mbps"
    echo "- PoE: $POE_REQ ($POE_WATTS W)"
    echo "- Security: $SEC_LEVEL"
    echo ""
    echo "RECOMMENDATIONS:"
    echo "- Cable Type: $CABLE"
    echo "- PoE Standard: $POE_STD"
    echo "- Security Logic: $SEC_REC"
    echo ""
    echo "RISKS/WARNINGS:"
    if [[ -z "$WARNINGS" ]]; then
        echo "- None. Configuration is within safe parameters."
    else
        echo -e "$WARNINGS"
    fi
    echo "=========================================="
} > "$FILENAME"

# 4. Success Output
echo -e "\n[+] Recommendation generated successfully!"
echo "[+] Saved to: $FILENAME"
cat "$FILENAME"

