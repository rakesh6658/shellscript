#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]
then
echo "user is not root user"
exit 1
else
echo "user is root"
fi
yum install gitt -y
status=$?
if [ $status -ne 0 ]
then
echo "git installation failure"
exit 1
else
echo "git installation success"
fi

