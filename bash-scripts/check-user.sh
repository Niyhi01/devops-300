#!/bin/bash

if [ -z "$1" ]; then
	echo "$0 <user>"
	exit 1
fi
if getent passwd "$1" > /dev/null; then
	echo "User exists: $1"
	
	echo "Home Directory: $(getent passwd "$1" | cut -d: -f6)"
	lastlog -u "$1"

else 
	echo "User does not exist"
	exit 1
fi
