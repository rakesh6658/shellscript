#!/bin/bash
date=$(date +%F-%H-%M-%S)
script_name=$0
location=/tmp
logfile=$location/$script_name-$date
usage=$(df -hT | grep -E -v 'tmpfs|Filesystem' | awk '{print $6}' | cut -d "%" -f 1)
echo "$usage"