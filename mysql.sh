#!/bin/bash
# should be root user
# if not stop execution and exit
x=$(id -u) 
if [ $x -ne 0 ]
then 
echo " not a root user "
exit 14
fi
yum install mysql -y
