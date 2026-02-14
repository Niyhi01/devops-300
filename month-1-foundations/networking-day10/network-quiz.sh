#!/bin/bash
echo "Quick Networking Quiz (Day 10)"
echo "1. What layer are routers on? (2 or 3)"
read -p "Answer: " ans1
[ "$ans1" = "3" ] && echo "Correct!" || echo "Wrong - Layer 3 (Network)"

echo "2. What does a switch use to forward traffic? (MAC or IP)"
read -p "Answer: " ans2
[ "$ans2" = "MAC" ] && echo "Correct!" || echo "Wrong - MAC addresses"

# Add 3 more questions yourself
