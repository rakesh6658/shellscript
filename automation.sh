#!/bin/bash

id=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
if [ $id -ne 0 ]
then
echo "user is not root user"
exit 1
else
echo "user is root"
fi
validate() {
    if [ $1 -ne 0 ]
    then
    echo -e  "$2 installation $R failure $N"
else
echo -e  "$2 installation $G success $N"
fi
}


for i in $@
do
 yum list installed $i &>> log1.log
 if [ $? -ne 0 ]
 then
yum install  $i -y &>> log1.log
status=$?
validate $status $i 
else
echo  -e "already installed $Y $i $N"
fi
done

