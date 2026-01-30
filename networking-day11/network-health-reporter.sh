#!/bin/bash

#defining my target and using 8.8.8.8 as default incase of no input value
TARGET=${1:-8.8.8.8}

# define a file with the timestamp name to log the report into
REPORT_FILE="report-$(date +%Y%m%d-%H%M%S).txt"

#confirming the connection to the target using ping
ping -c 1 $TARGET > /dev/null 2>&1

if [ $? -ne 0 ]; then
	echo "Error! $TARGET unreachable after 1 attempt"
	exit 1
fi

{

#traceroute  with maximum hop of 15
traceroute -m 15 $TARGET

# using nslookup to check the DNS resolution
nslookup $TARGET

#testing the ports 80 & 443 using netcat
if nc -z -w 2 $TARGET 80; then
	echo "Port 80 is OPEN"
else
	echo  "Port 80 is CLOSED"
fi

if nc -z -w 2 $TARGET 443; then
        echo "Port 443 is OPEN"
else
        echo  "Port 443 is CLOSED"
fi

#fishing out the top 5 local listing ports
sudo ss -tulpn | awk 'NR>1 {print $5}' | cut -d: -f2 | sort | uniq -c | sort -nr | head -n 5
} | tee $REPORT_FILE
