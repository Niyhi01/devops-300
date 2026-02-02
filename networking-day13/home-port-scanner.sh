# 1. Shebang line
# 2. Assign ROUTER_IP ($1 or default)
# 3. Create a filename with current date for the report
# 4. Initialize an OPEN_PORTS_COUNT variable at 0
# 5. Define a list of ports to scan: 21, 23, 80, 443, 445
# 6. Start a loop to iterate through each port
# 7. Inside loop: Run nc -z -w 2 on the IP and Port
# 8. Check exit status ($?):
#    - If 0: Port is open. Increment count. Echo "High Risk" to screen and file.
#    - If not 0: Port is closed. Echo "Good" to screen and file.
# 9. After loop: Calculate Risk Level (Low/Medium/High) using if/elif
# 10. Print final summary and tell user where the report is saved

#!/bin/bash
ROUTER_IP=${1:-192.168.1.1}
OPEN_PORT_COUNT=0
REPORT=port-scan-report-$(date +%Y%m%d).txt

{
echo "Scanning $ROUTER_IP..."
for PORT in 21 23 80 443 445; do
	nc -z -w 2 $ROUTER_IP $PORT
	if [ $? -eq 0 ]; then
		echo "Port $PORT open -> High Risk!"
		((OPEN_PORT_COUNT++))
	else 
		echo "Port $PORT closed -> Good"
	fi
done

if [ $OPEN_PORT_COUNT -ge 4 ]; then
    RISK="HIGH"
elif [ $OPEN_PORT_COUNT -ge 2 ]; then
    RISK="MEDIUM"
else
    RISK="LOW"
fi
} | tee -a $REPORT
