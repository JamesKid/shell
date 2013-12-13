#!/bin/bash 
# Description:  this program  is use id,finger command to check system account's information.
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-09 creat zsj

users=$(cut -d ':' -f1 /etc/passwd) # 撷取账号名称
for username in $users # 开始循环进行！
	do
		id $username
		finger $username
	done

