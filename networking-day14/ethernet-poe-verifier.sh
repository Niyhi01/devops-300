# 1. Shebang and initialize SCORE variable at 0
# 2. Print summary of T568B wire order (Orange-White, Orange, Green-White, Blue...)
# 3. Print fact about PoE++ (802.3bt) providing up to 60-100 Watts
# 4. Question 1: What is the standard wire order used for most patch cables? (T568B/T568A)
# 5. Question 2: Does PoE+ (802.3at) provide more power than standard PoE? (yes/no)
# 6. Question 3: Why are pairs twisted? (Crosstalk/Interference)
# 7. Use if/else to check answers and increment SCORE using ((SCORE++))
# 8. Print final score and a "Physical Layer Master" message

#!/bin/bash
echo "Welcome! This is Ethernet Cable & PoE Knowledge Verifier"
SCORE=0
echo "
Some Real Facts on Ethernet Cable & PoE Knowledge:
1. T568B wire is arranged in order, Orange-White, Orange, Green-White, Blue, Blue-White, Green, Brown-White, Brown.
2. PoE++ (802.3bt, Type 4) provide up to 90 Watts, while 802.3at give 30 Watts
3. Twisted pair is used to avoid Crosstalk
"
echo ""
echo "Questions based on Ethernet Cable & PoE Knowledge:"
echo "1. What is the standard wire order used for most patch cables? (T568B/T568A)"
read ans1
if [[ ${ans1,,} == "t568b" ]]; then
	echo "Correct!"
	((SCORE++))
else
	echo "Wrong, T568B is the standard wire order"
fi

echo "
2. Does PoE+ (802.3at) provide more power than standard PoE? (yes/no)" 
read ans2
if [[ ${ans2,,} == "yes" ]]; then
	echo "Correct!"
	((SCORE++))
else 
	echo "Wrong, PoE+ provide more power"
fi

echo "
3. Why are pairs twisted? (Crosstalk/Interference)"
read ans3
if [[ ${ans3,,} == "crosstalk" ]]; then
	echo "Correct!"
	((SCORE++))
else 
	echo "Wrong, Twisted pairs are used to avoid Crosstalk"
fi

echo "
Your Final Score is: $SCORE/3"
