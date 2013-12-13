#!/bin/bash 
# Description:  this program  is to show user's choice 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

read -p "Please input (Y/N):" yn  
[ "$yn" == "Y" -o "$yn" == "y" ] && echo "OK,continue" && exit 0 
[ "$yn" == "N" -o "$yn" == "n" ] && echo "Oh,interrupt!" && exit 0 
echo "I don't know what your choice is " && exit 0 


