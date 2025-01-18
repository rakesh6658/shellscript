#!/bin/bash
# prompting user to enter password
echo "enter your username"
read username
echo "enter your password"
read password
echo "your username is $username and password is $password"
# to hide password  from terminal use read -s 