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
r=\e[31m
g=\e[32m
y=\e[33m
n=\e[0m
validate(){
if [ $1 == 0 ]
then
echo -e " $g $2 installation .... success $n"
else
echo -e " $r $2 installation ... failure $n"
fi     
}
for i in $@
do
yum list installed $i &>> $logfile
if [ $? == 0 ]
then
echo -e " $y $i is already installed $n "
else
yum install $i -y &>> $logfile
validate $? $i 
fi
done
echo -e "\e[33m welcome to hyd"
