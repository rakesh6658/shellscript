#!/bin/bash
# should be root user
# if not stop execution and exit
x=$(id -u) 
if [ $x -ne 0 ]
then 
echo " not a root user "
exit 14
fi
validate(){
if [ $1 == 0 ]
then
echo " $2 installation is success "
else 
echo " $2 installation is failure"
fi

}
yum install mysql -y
validate $? mysql
yum install git -y 
validate $? git


