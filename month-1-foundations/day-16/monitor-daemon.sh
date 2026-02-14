#!/bin/bash
while true; do
mkdir -p /var/log/devops-monitor/
LOG_FILE="/var/log/devops-monitor/health.log"
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
RAM_USAGE=$(free -m | grep "Mem" | awk '{printf "%d", $3*100/$2}')

echo "Checking Disk Usage..."
if (( DISK_USAGE > 80 )); then
	echo "ALERT $(date +%Y%m%d-%H%M%S): Disk Usage is at ${DISK_USAGE}%" | tee -a $LOG_FILE
fi

echo "Checking Ram Usage..."
if (( RAM_USAGE > 85 )); then
        echo "ALERT $(date +%Y%m%d-%H%M%S): Ram Usage is at ${RAM_USAGE}%" | tee -a $LOG_FILE
fi

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "Checking CPU Usage..."
if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
    echo "ALERT $(date +%Y%m%d-%H%M%S): CPU Usage is high at ${CPU_USAGE}%" | tee -a $LOG_FILE
fi

echo "Checking for failed logins..."
FAILED_COUNT=$(grep "Failed password" /var/log/auth.log | wc -l)

if [ "$FAILED_COUNT" -gt 5 ]; then
    echo "ALERT $(date +%Y%m%d-%H%M%S): Detected $FAILED_COUNT failed login attempts!" | tee -a $LOG_FILE
fi

sleep 300
done
