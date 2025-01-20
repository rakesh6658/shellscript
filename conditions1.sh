#!/bin/bash
#check if the number is greater than 10 or not
x=$1
y=10
 if [ $x -gt $y ]
 then
 echo " $x is greater than $y"
 elif [ $x == $y ]
 then 
 echo " $x equal to $y "
 else
 echo " $x is less than $y"
 fi