#!/bin/bash
userid=$(id -u)
date=$(date +%F-%H-%M-%S)
filename=$0
logfile=/tmp/$filename-$date.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
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
 sudo yum list installed $i &>>$logfile
 if [ $? -ne 0 ]
 then
 yum install $i -y &>>$logfile
 validate $? $i
 else
 echo -e "$Y $i is already installed $N "
 fi
done


