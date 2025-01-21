#!/bin/bash

user=$(id -u)
if [ $user -ne 0 ]
then
echo "user is not root user"
fi
LOGDIR=/home/centos/shellscriptlogs
name=$0
date=$(date +%F-%H-%M-%S)
logfile=$LOGDIR/$name-$date
R="/e[31m"
G="/e[32m"
Y="/e[33m"
N="/e[0m"
validate(){
if [ $1 == 0 ]
then
echo -e " $G $2 installation .... success $N"
else
echo -e " $R $2 installation ... failure $N"
fi     
}
for i in $@
do
yum list installed $i &>> $logfile
if [ $? == 0 ]
then
echo -e " $Y $i is already installed $N "
else
yum install $i -y &>> $logfile
validate $? $i 
fi
done
