#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo " user is not root "
fi
echo " welcome to shellscript"