#!/bin/bash
logsdir=/home/centos/shellscriptlogs
deletelogsdir=/home/centos/deletelogs
date=$(date +%F-%H-%M-%S)
name=$0
logfile=$deletelogsdir/$name-$date
files_to_delete=$(find $logsdir -name "*.log" -type f -mtime +370)
echo "files to delete $files_to_delete"
