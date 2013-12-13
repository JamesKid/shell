#!/bin/bash 
# Description:  this program use the other form of "for" to calculate 1+2+..your_input_number
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

read -p "please input a number,I will count for 1+2+...+your_input:" nu
s=0
for((i=1;i<=$nu;i=i+1))
	do
		s=$(($s+$i))
	done
echo "The result of '1+2+3+...+ $nu' is ==> $s"


