#!/bin/bash 
# Description:  this program is test what service is open 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

# 1.先作一些告知的动作而已
echo "Now, I will detect your linux server's services!" 
echo -e "The www,ftp,ssh,and mail will be detect!\n"

# 2.开始进行一些测试的工作，并且也输出一些信息
testing=$(netstat -tuln | grep ":80") # 侦测80端品是否存在
if [ "$testing" != "" ]; then 
	echo "WWW is running in your system." 
fi 
testing=$(netstat -tuln | grep ":22") # 侦测22端品是否存在
if [ "$testing" != "" ]; then 
	echo "ssh is running in your system." 
fi 
testing=$(netstat -tuln | grep ":21") # 侦测21端品是否存在
if [ "$testing" != "" ]; then 
	echo "ftp is running in your system." 
fi 
testing=$(netstat -tuln | grep ":25") # 侦测25端品是否存在
if [ "$testing" != "" ]; then 
	echo "mail is running in your system." 
fi 

