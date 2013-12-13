#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

case $1 in 
	"hello") 
		echo "Hellow,how are you ?"
		;;
	"")
		echo "You must input parameters, ex>{$0 someword}"
		;;
	*) # 其实就相当于通配符，0到无穷多个任意字符之意
		echo "Usage $0 {hello}
		;;
esac

