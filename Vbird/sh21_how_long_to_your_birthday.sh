#!/bin/bash 
# Description:  this program is to print how long to your latest birthday
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-10 creat zsj

read -p "please input your birthday (MMDD,ex>0709):" bir
now=`date +%m%d`
if [ "$bir" == "$now" ];then 
	echo "Happy birthday to you !!"
elif [ "$bir" -gt "$now" ];then 
	year = `date +%Y`
	total_d=$(($((`date --date="$year$bir" +%s`-`date +%s`))/60/60/24))
	echo "Your birthday will be $total_d later"
else
	year=$((`date +%Y`+1))
	total_d=$(($((`date --date="$year$bir" +%s`-`date +%s`))/60/60/24))
	echo "Your birthday will be $total_d later"
fi
