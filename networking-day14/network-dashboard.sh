# 1. Shebang line
# 2. Define HTML_FILE variable with current date
# 3. Define TARGET (default or $1)
# 4. Write HTML header to file (html, head, body, title tags)
# 5. Write Section 1: Connection Health (Ping results)
# 6. Write Section 2: DNS Resolution (nslookup/dig results)
# 7. Write Section 3: Port Scan results (call home-port-scanner.sh)
# 8. Use <pre> tags in HTML to maintain the text formatting of script outputs
# 9. Logic: Check exit codes to determine color coding (e.g., if fail, wrap in red text)
# 10. Write HTML closing tags (</body></html>)
# 11. Print message: "Dashboard generated: [filename]"

#!/bin/bash
HTML_FILE="diagnostic-dashboard-$(date +%Y%m%d).html"
SCRIPTS=("networking-day9/network-diagnostic.sh" "networking-day10/network-layer.sh" "networking-day11/network-health-reporter.sh" "networking-day12/dns-cache-lookup.sh" "networking-day13/home-port-scanner.sh")
NUMBER=1

cat <<EOF > $HTML_FILE
<html>
<head><title>DevOps Network Dashboard</title></head>
<body style="font-family: Arial, sans-serif; padding: 20px;">
<h1>Network Diagnostic Dashboard v1</h1>
<p>Generated on: $(date)</p>
<hr>
EOF

for SCRIPT in "${SCRIPTS[@]}"; do
    echo "<h2>Module $NUMBER: $SCRIPT</h2>" >> $HTML_FILE
    echo "<pre style='background-color: #2e2e2e; color: #00ff00; padding: 15px; border-radius: 5px; overflow: auto;'>" >> $HTML_FILE
    
    bash "$HOME/devops-300/$SCRIPT" >> $HTML_FILE 2>&1
    
    echo "</pre>" >> $HTML_FILE
    ((NUMBER++))
done

echo "</body></html>" >> $HTML_FILE

echo "Dashboard successfully generated: $HTML_FILE"
