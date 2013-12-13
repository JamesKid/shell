#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

function printit(){
	echo "your choice is $1" # 这个$1必须要参考底下指令的下达
}
echo "This program will print your selection!"
case $1 in 
	"one")
		printit 1 # 请注意，printit指令后面还有接参数
		;;
	"two")
		printit 2
		;;
	"three")
		printit 3 
		;;
	*)
		echo "usage $0 {one|two|three}"
		;;
esac	
