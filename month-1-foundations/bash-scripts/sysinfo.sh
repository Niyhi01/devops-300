#!/bin/bash
date
uptime
users
who
uptime | awk '{print $8,$9,$10}'
free | grep Mem -h
df /
