#!/bin/bash
# network-diagnostic.sh - Your first DevOps Tool

TARGET=${1:-8.8.8.8} 

echo -e "\033[1;36mDiagnostic Report for: $TARGET\033[0m"
echo "----------------------------------------"

# 1. Ping Test with Logic
echo "1. Checking Reachability (Ping)..."
if ping -c 2 $TARGET > /dev/null 2>&1; then
    echo -e "\033[0;32m[SUCCESS] Target is reachable.\033[0m"
    ping -c 2 $TARGET | grep "time="
else
    echo -e "\033[0;31m[FAILED] Target unreachable.\033[0m"
fi

# 2. Traceroute - Shows every 'hop' (router) between you and the target
echo -e "\n2. Path Analysis (Traceroute):"
traceroute -m 10 $TARGET | tail -n +2

# 3. DNS Lookup - Checks if the internet knows how to translate the name
echo -e "\n3. DNS Resolution:"
nslookup $TARGET | grep -A 1 "Name:"

# 4. Port Check - Checking for Web Ports (The Bonus Task)
echo -e "\n4. Checking Web Ports (80/443):"
for port in 80 443; do
    nc -zv -w 2 $TARGET $port 2>&1 | grep "succeeded" || echo "Port $port is closed."
done

# 5. Local Listening Ports
echo -e "\n5. Local Listening Ports (Top 5):"
ss -tuln | grep LISTEN | head -5

echo "----------------------------------------"
echo -e "\033[1;32mDiagnostic complete.\033[0m"
