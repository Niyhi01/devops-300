#!/bin/bash
while true; do                 # Infinite loop
    echo "1) ... 4) Exit"       # Show options
    read -p "Choose: " choice   # Wait for number input
    case $choice in             # Switch statement
        1) df -h ;;             # Double semicolon = end of case
        2) uptime ;;
        3) who ;;
        4) exit 0 ;;            # 0 = success exit
        *) echo "Invalid" ;;    # * = any other input
    esac                        # End case
    echo                        # Blank line
done                           # Loop forever
