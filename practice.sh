#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " user is not root "
exit 1
fi
echo " welcome to shellscript"