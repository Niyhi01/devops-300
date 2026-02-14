#!/bin/bash
while true; do
    if [[ $(df -h / | awk 'NR==2 {print $5}' | tr -d '%') -gt 80 || $(uptime | awk '{print $10}' | tr -d ',') -gt 2 ]]; then
        echo "WARNING: High usage at $(date)"
    else 
        echo "No issue at $(date)" 
    fi
    sleep 60
done
