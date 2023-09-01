#!/bin/bash

id=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
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
exit 1
else
echo -e  "$2 installation $G success"
fi
}


for i in $@
do
yum install  $i -y &>> log1.log
status=$?
validate $status $i 
done

