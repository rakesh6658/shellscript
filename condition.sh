#!/bin/bash
num=100
if [ $num -lt 10 ] 
then
echo "$num is less than 10"
else
echo "$num is greater than 10"
for i in ( $num -lt 10 )
do
echo "$i"
done

fi

