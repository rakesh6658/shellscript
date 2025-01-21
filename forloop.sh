#!/bin/bash

user=$(id -u)
if [ $user -ne 0 ]
then
echo "user is not root user"
fi
for i in $@
do
yum install $i -y
done
