#!/bin/bash
userid=$(id -u)
validate(){
    if [ $1 -ne 0 ]
then
echo "$2 installation is failure"
else 
echo " $2 installation is success"
fi
}
if [ $userid -ne 0 ]
then
echo " user is not root "
exit 1
fi
for i in {1..100}
do
echo $i
done

yum install git -y
validate $? git


yum install postfix -y
validate $? postfix
ym install javaa -y
validate $? java
