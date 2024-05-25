#!/bin/bash
userid=$(id -u)
date=$(date +%F-%H-%M-%S)
filename=$0
logfile=/tmp/$filename-$date.log
R=\e[31m
G=\e[32m
N=\e[0m
validate(){
    if [ $1 -ne 0 ]
then
echo  -e "$2 installation is $R failure $N"
else 
echo -e " $2 installation is $G success $N"
fi
}
if [ $userid -ne 0 ]
then
echo " user is not root "
exit 1
fi
for i in $@
do
yum install $i -y &>>$logfile
validate $? $i
done

