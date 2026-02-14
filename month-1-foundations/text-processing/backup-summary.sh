#!/bin/bash

LOG="backup-log.txt"

# 1. Log Start Time
echo "Backup started at: $(date)" >> $LOG

# 2. Run the actual backup (Make sure the path is correct!)
# If backup.sh is in your current folder, use ./backup.sh

./backup.sh ~/devops-300

# 3. Check Success/Failure
if [ $? -eq 0 ]; then
    echo "Backup OK"
else
    echo "BACKUP FAILED" | tee -a errors.log
fi

# 4. Log End Time
echo "Backup ended at: $(date)" >> $LOG
