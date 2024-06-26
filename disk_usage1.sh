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
 usage=$(echo $line | awk '{print $6}' | cut -d "%" -f 1 )

partition=$(echo $line | awk '{print $1}' )
if [ $usage -gt $threshold ]
then

message+="high disk uasge on $partition : $usage \n"
fi
done <<<$disk_usage

sh mail.sh rakeshreddythummala944@gmail.com devops_team "$message" "high disk usage"
