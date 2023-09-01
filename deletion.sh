#!/bin/bash

location="/home/centos/shellscript"
date=$(date "+%Y-%m-%d-%I-%M-%S")
#echo "$date"
logfile="deleted-$date.log"
filenames=$(find $location -name "*.log" -type f -mtime -32)
echo "$filenames
while read -r line
do
  echo "deleting $line " >> $logfile
  rm -rf $line
done <<< "$filenames"


