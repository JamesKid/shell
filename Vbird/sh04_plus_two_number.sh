#!/bin/bash 
# Description:  this program is to plus two number
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-06 creat zsj

echo -e "You should input 2numbers, I will cross then !\n "
read -p "first number:" firstnu
read -p "second number:" secnu
total=$(($firstnu*$secnu))
echo -e "\nThe result of $firstnu x $secnu is ==> $total"
