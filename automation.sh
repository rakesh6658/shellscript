#!/bin/bash

id=$(id -u)

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
    echo "$2 installation failure"
exit 1
else
echo "$2 installation success"
fi
}
yum install git -y
status=$?
validate $status $git 


