#!/bin/bash
# Usage: ./subnet-check.sh 192.168.1.0/24

if [ $# -ne 1 ]; then
	echo "Usage: $0 CIDR"
	exit 1
fi

CIDR=$1

# Install ipcalc if missing (one time)
# sudo apt install ipcalc -y

ipcalc $CIDR
