#!/bin/bash
SUBNET="192.168.9.0/24"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTPUT_FILE="network-scan-$TIMESTAMP.txt"

echo "Starting network scan on $SUBNET"

sudo nmap -sV -O $SUBNET -oN $OUTPUT_FILE

echo "Scan complete, Results saved to $OUTPUT_FILE" 
