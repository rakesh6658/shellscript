#!/bin/bash
date=$(date +%F:%H:%M:%S)
scriptname=$0
location=/home/centos/shellscriptlogs
logfile=$scriptname-$date.log

echo "$date $scriptname"
filestodelete=$(find /home/centos/applogs -name *.log -type f -mtime +14)
for i in $filestodelete
do
echo "$i" 
done