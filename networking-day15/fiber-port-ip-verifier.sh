# 1. Clear screen and show Welcome Message
# 2. Fact Summary: Light pulses (Fiber), MAC Sticky (Security), Logical Addr (IP)
# 3. Question 1: Fiber - Single-mode or Multimode for long distance?
# 4. Question 2: Port Security - What mode shuts down the port on violation?
# 5. Question 3: IP - Is 192.168.1.1 Public or Private?
# 6. Calculate results and show a motivational "Lagos Tech" message.

#!/bin/bash
echo "Welcome to Day 15 of Devops Journey: Networking-Day15"
echo ""
echo "Facts on Fiber optics, Port security & Ip knowledge:"
echo "1. Fiber Optics are more faster than Ethernet Cable, and signal is transmitted through light"
echo "2. Knowing how to secure your ports is very important to avoid port enabled hackings and vulnerabilities"
echo "3. Ip address is what devices use to identify and communicate to each other"
echo ""

SCORE=0
echo "Questions based on Fiber optics, Port security & Ip knowledge:"
read -p "Question 1: Fiber - Single-mode or Multimode for long distance?" ANS
if [ ${ANS,,} == "single-mode" ]; then
	echo "Correct! There is little refraction in singel-mode which makes it faster and ideal for long distance."
	((SCORE++))
elif [ ${ANS,,} == "multimode" ]; then
	echo "Wrong! There is high refraction in multimode, which cause to be slower and not ideal for long distance"
else
	echo "Pls select correct option"
fi
echo ""
read -p "Question 2: Port Security - What mode shuts down the port on violation?" ANS
if [ ${ANS,,} == "shutdown" ]; then
	echo "Correct! Shutdown mode shut the port down on violation"
	((SCORE++))
else
	echo "Wrong! Shutdown mode shut the port down on violation"
fi
echo ""
read -p "Question 3: IP - Is 192.168.1.1 Public or Private?" ANS
if [ ${ANS,,} == "private" ]; then
	echo "Correct! It is a private IP"
	((SCORE++))
else 
	echo "Wrong! That is a private IP"
fi
echo ""
echo "Your Final Score: $SCORE/3"
