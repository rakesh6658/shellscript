#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " user is not root "
exit 1
fi
yum install git -y

if [ $? -ne 0 ]
then
echo "installation is failure"
else 
echo "installation is success"
fi
yum install postfix -y
if [ $? -ne 0 ]
then
echo "installation is failure"
else 
echo "installation is success"
fi
