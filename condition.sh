#!/bin/bash
num=100
if [ $num -lt 10 ] 
then
echo "$num is less than 10"
else
echo "$num is greater than 10"
fi
for i in {1..100}
do
echo "$i"
done

