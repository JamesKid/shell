#!/bin/bash 
# Description:  this program is to test if the file exist ,if exist do someting 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-10 creat zsj

if [ ! -e logical ];then 
	touch logical
	echo "Just make a file logical" 
	exit 1
elif [ -e logical ] && [ -f logical ];then 
	rm logical 
	mkdir logical 
	echo "remove file ==>logical "
	echo "and make direcotry logical" 
	exit 1 
elif [ -e logical ] && [ -d logical ];then 
	rm -rf logical 
	echo "remove directory ==> logical" 
	exit 1
else
	echo "Does here have anything?"
fi
