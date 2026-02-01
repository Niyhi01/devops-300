# 1. Shebang line
# 2. Print a welcome message: "SOHO Router Security Auditor"
# 3. List 3 critical vulnerabilities (Default passwords, WPS, Remote Management)
# 4. Prompt user: "Is your admin password still 'admin' or 'password'?"
# 5. Logic: If yes, echo "CRITICAL RISK: Change it now!"
# 6. Prompt user: "Is WPA3 or WPA2 enabled? (yes/no)"
# 7. Logic: If no, echo "WARNING: Upgrade your WiFi encryption."
# 8. Print a final recommendation summary


#!/bin/bash

echo "SOHO Router Security Auditor"
echo ""
echo "Common Network Vulnerabilities
1. Default Passwords
2. WPS
3. Remote Management
4. Carelessness with Public ip address"

echo ""

echo "Is your admin password still 'admin' or 'password'?"
read  ans1
if  [[ $ans1 == "yes" ]]; then
	echo "CRITICAL RISK: Change it now!"
elif [[ $ans1 == "no" ]]; then
	echo "GREAT! always make sure to change your password"
else
	echo "pls select 'yes' or 'no'"
	exit 1
fi

echo ""

echo "Is WPA3 or WPA2 enabled? (yes/no)"
read  ans1
if  [[ $ans1 == "yes" ]]; then
        echo "GREAT! always make sure its enabled"
elif [[ $ans1 == "no" ]]; then
        echo "WARNING: Upgrade your WiFi encryption."
	
else
        echo "pls select 'yes' or 'no'"
	exit 1
fi

echo ""


echo "Recommendation Message
1. Always make sure your WPA3 or WPA2 is enabled
2. Always change your password from default
3. Be careful with your ip address, dont give it out
"

