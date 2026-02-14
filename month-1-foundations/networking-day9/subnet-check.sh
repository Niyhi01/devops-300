#!/bin/bash
CIDR=$1
if [ -z "$CIDR" ]; then
    echo "Usage: $0 CIDR (e.g., 192.168.1.0/24)"
    exit 1
fi

echo -e "\033[1;34mSubnet Info for $CIDR\033[0m"
ipcalc $CIDR | grep -E "Address:|Netmask:|Network:|HostMin:|HostMax:|Broadcast:|Hosts/Net:"
