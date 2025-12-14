#!/bin/bash


if [[ $(df -h / | awk 'NR==2 {print $5}' | tr -d '%') -gt 80 || $(uptime | awk '{print $9}') -gt 2 ]]; then

	echo "warning"
else 
	echo "no issue" 
fi
