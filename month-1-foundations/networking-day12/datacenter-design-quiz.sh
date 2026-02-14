#!/bin/bash

# 1. Clear the screen for a professional feel
# 2. Echo summaries of 3-Tier (Access, Distribution, Core)
# 3. Echo summaries of Spine-Leaf (Scale, East-West traffic)
# 4. Use 'read -p' to ask which is better for server-to-server traffic
# 5. Use 'if/else' to check if the answer is Spine-Leaf


echo "3-tier design uses north-south to access data which cause latency and difficulty for server to server communication"
echo "spine-leaf design is a two level design that allow fast sever to server communication through the east-west format"

echo "3-tier design is better for east-west traffice, yes or no"
read Ans1
if [ $Ans1 == "no" ]; then
	echo "Correct"
else
	echo "Wrong"
fi

echo "spine-leaf design is faster, yes or no"
read Ans2
if [ $Ans2 == "yes" ]; then
	echo "Correct"
else
	echo "Wrong"
fi
