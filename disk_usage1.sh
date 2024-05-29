#!/bin/bash
date=$(date +%F-%H-%M-%S)
script_name=$0
location=/tmp
logfile=$location/$script_name-$date
threshold=1
message=
disk_usage=$(df -hT | grep -E -v 'tmpfs|Filesystem') 

while IFS= read line
do
 usage = $(echo $line | awk '{print $6}' | cut -d "%" -f 1 )
partition= $(echo $line | awk '{print $1}' )
message+="high disk uasge on $partition : $usage \n"
done <<< $disk_usage
echo -e "$message"


