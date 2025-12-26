#!/bin/bash


tail -f /var/log/syslog | grep -Ei --color=always "error|fail" |tee -a ~/errors-today.log
