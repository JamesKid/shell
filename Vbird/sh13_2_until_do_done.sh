#!/bin/bash 
# Description:  this program is to test until do done 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

until [ "$yn" == "yes" -o "$yn" == "YES" ] 
	do 
		read -p "please input yes/YES to stop this program:" yn 
	done
echo "OK! you input the correct answer."

