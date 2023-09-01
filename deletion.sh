#!/bin/bash

location=/home/centos/shellscript
date=$(date "+%Y-%m-%d-%I-%M-%S")
#echo "$date"
scriptname=$0
logfile="$scriptname-$date.log"
filenames=$(find $location -name "*.log" -type f -mtime -32)

while read -r line
do
  echo "deleting $line " >> $logfile
  rm -rf $line
done >>> $filenames


