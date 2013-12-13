#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

function printit(){
	echo -n "your choice is " # 加上-n 可以不断行继续在同一行显示
}	
echo "This program will print your selection!"
case $1 in 
	"one")
		printit; echo $1 | tr 'a-z' 'A-Z' # 将参数做大小写转换！
		;;
	"two")
		printit; echo $1 | tr 'a-z' 'A-Z' # 将参数做大小写转换！
		;;
	"three")
		printit; echo $1 | tr 'a-z' 'A-Z' # 将参数做大小写转换！
		;;
	*)
		echo "Usage $0 {one|two|three}"
		;;
esac
