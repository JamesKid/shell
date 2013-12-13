#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

network="192.168.1"   #先定义一个网域的前面部分！
for sitenu in $(seq 100 130)   # seq为sequence（连续)的缩写之意
	do 
		# 底下的程序在取得ping 的回传值是正确的还是失败的！
		ping -c 1 -w 1 ${network}.${sitenu} &> /dev/null && result=0 || result=1
		# 开始显示结果是正确的启动（UP）还是错误的没有连通(DOWN)
		if [ "$result" == 0 ]; then 
			echo "Server ${network}.${sitenu} is UP."
		else 
			echo "Server ${network}.${sitenu} is DOWN."
		fi
	done 
