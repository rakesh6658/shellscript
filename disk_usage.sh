#!/bin/bash

date=$(date "+%Y-%m-%d-%I-%M-%S")
#echo "$date"
script_name="$0"
logfile="$script_name-$date.log"
#echo "$logfile"
disk_usage=$(df -hT | grep -vE 'tmpfs|Filesystem')
#echo "$usage"
treshold_usage=1
while IFS= read line
do
usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
partition=$(echo $line | awk '{print $1}')
if [ $usage -gt $treshold_usage ]
then 
 message+= echo -e "HIGH DISK USAGE on $partition: $usage\n"
 fi
done <<< "$disk_usage"
#echo "$message"

echo "$message" | mail -s "alert" rakeshreddythummala944@gmail.com

