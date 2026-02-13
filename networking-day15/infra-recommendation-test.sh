# 1. Initialize variables (CABLE, POE_STD, SEC_ADVICE)
# 2. Input Block: Prompt for Distance (m), Speed (Mbps), PoE (y/n), Security (1-3)
# 3. Logic Layer 1 (Distance/Speed): If > 100m, suggest Fiber. If < 100m + 1Gbps, suggest Cat6.
# 4. Logic Layer 2 (Fiber Type): If Fiber + > 500m, suggest Single-mode. Else Multimode.
# 5. Logic Layer 3 (PoE): If yes, ask for Watts. If > 30W, suggest 802.3bt (PoE++).
# 6. Logic Layer 4 (Security): If High, suggest Shutdown mode + Sticky MAC.
# 7. Risk Check: Flag if user wants high PoE on old/cheap cables (Cat5e).
# 8. Output Block: Print recommendation to screen for immediate feedback.
# 9. File Export: Redirect all results into infra-recommendation-$(date +%Y%m%d).txt.
# 10. Exit message with a success confirmation.

#!/bin/bash
CABLE=""
POE_STD=""
SEC_ADVICE=""
read -p "What is the distance range you need this setup for (m):" DIST
if [ $DIST -gt 500 ]; then
	echo "Since the distance is more than 100m, I will suggest Fiber, and Single-mode will be ideal for this since its more than 500m"
	CABLE="Single-mode Fibre Optics Cable"
elif [[ $DIST -gt 100 ]] && [[ $DIST -lt 500 ]]; then
	echo "Since the distance is more than 100m, I will suggest Fiber, and Multimode will be ideal for this since its less than 500m"
	CABLE="Multimode Fibre Optics Cable"
else
	echo "Since the distance is less than 100m, I will suggest Cat6"
	CABLE="Cat6 Ethernet Cable"
fi


read -p "Do you prefer PoE?" ANS
if [ ${ANS,,} == "yes" ]; then
	read -p "What Watts do you prefer (W)" WATTS
	if [ $WATTS -gt 30 ]; then
		echo "I suggest PoE++, 802.3bt"
		POE_STD="PoE++ 802.3bt"
	else
		echo "I suggest PoE type1"
		POE_STD="PoE type1"
	fi

else 
	echo "Okay cool, no PoE"
	POE_STD="No PoE"
fi

read -p "What level of security do you want" SEC
if [ ${SEC,,} == "high" ]; then
	echo "I suggest using Shutdown mode + Sticky MAC"
	SEC_ADVICE="Shutdown mode + Sticky MAC"
elif [ ${SEC,,} == "Medium" ]; then
	echo "I suggest using Restrict mode"
	SEC_ADVICE="Resrict mode"
else
	echo "We can go with Protect mode"
	SEC_ADVICE="Protect mode"
fi
	
echo "In Conclution, you setup should be: $CABLE, $POE_STD, $SEC_ADVICE"
