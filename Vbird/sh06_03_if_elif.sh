#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

read -p "Please input (Y/N):" yn 
if [ "$yn" == "Y" ] || [ "$yn" == "y" ]; then 
	echo "OK, continue" 
elif [ "$yn" == "N" ] || [ "$yn" == "n" ]; then 
	echo "Oh, interrupt!"
else
	echo "I don't know what your choice is " 
fi
