#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

echo "This program will print you rselection !"
# read -p "input your choice:" choice # 暂时取消，可以替换
# case $choice in  # 暂时取消，可以替换！
case $1 in     # 现在使用，可以用上面两行替换!
	"one")
		echo "your choice is ONE"
		;;
	"two")
		echo "your choice is TWO"
		;;
	"three")
		echo "your choice is THREE"
		;;
	*)	
		echo "Usage $0 {one|two|three}"
		;;
esac
	

