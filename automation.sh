#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]
then
echo "user is not root user"
exit 1
else
echo "user is root"
fi
yum install git -y

