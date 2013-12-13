#!/bin/bash 
# Description:  this program  is to calculate 1+2+3+...+100
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

s=0 #  这是加总的数值变数
i=0 #  这是累计的数值，亦即是1,2,3...
while [ "$i" != "100" ]
	do 
		i=$(($i+1)) # 每次i都会增加1
		s=$(($s+$i)) # 每次都会加总一次!
	done
echo "The result of '1+2+3+...+100' is ==> $s"

