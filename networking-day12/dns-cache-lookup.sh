#declare shibang and bash
#declear target
#create the cache file if not exist
#check the cache file for the target nslookup
#retrieve if target exist in the cache file
#go for external lookup if target not exitst in the cache file
#store the result in the cache file after external lookup
#print out the result 
#if external lookup fail. print an error message
#test by running multiple times


#!/bin/bash

TARGET=${1:-google.com}
CACHE_FILE="local-dns-cache.txt"
if [ -f $CACHE_FILE ]; then
	if grep $TARGET $CACHE_FILE > /dev/null; then
		echo "Cache Hit!"
		grep $TARGET $CACHE_FILE
	else
		echo "Cache Miss – Querying DNS..."
		IP=$(dig +short $TARGET)
		if [ -z "$IP" ] || grep "Error" $IP > /dev/null 2>&1; then
			echo "Error, could not resolve IP for $TARGET"
		else
			echo "$TARGET $IP" | tee -a $CACHE_FILE
		fi
	fi	
else
	echo "No Cache file, creating one"
	touch $CACHE_FILE
	if [ -z "$IP" ] || grep "Error" $IP > /dev/null 2>&1; then
		echo "Error, could not resolve IP for $TARGET"
	else
		echo "$TARGET $IP" | tee -a $CACHE_FILE
	fi
fi






