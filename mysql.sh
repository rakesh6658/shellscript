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
exit=$?
if [ $exit == 0 ]
then
echo "installation is success "
else 
echo " installation is failure"
fi
yum install gitt -y
exit=$?
if [ $exit == 0 ]
then
echo "installation is success "
else 
echo " installation is failure"
fi

