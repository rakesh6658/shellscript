#!/bin/bash
userid=$(id -u)
validate(){
    if [ $1 -ne 0 ]
then
echo "installation is failure"
else 
echo "installation is success"
fi
}
if [ $userid -ne 0 ]
then
echo " user is not root "
exit 1
fi
yum install git -y
validate $? 


yum install postfix -y
validate $?
