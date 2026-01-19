#!/bin/bash
echo "Quick Port Quiz (Day 11)"
echo "1. What port is HTTP? (80 or 443)"
read -p "Answer: " ans1
[ "$ans1" = "80" ] && echo "Correct!" || echo "Wrong - 80 for HTTP, 443 for HTTPS"

echo "2. What protocol uses port 53? (DNS or HTTP)"
read -p "Answer: " ans2
[ "$ans2" = "DNS" ] && echo "Correct!" || echo "Wrong - DNS"

# Add 2 more questions yourself (e.g., TCP vs UDP ports)
