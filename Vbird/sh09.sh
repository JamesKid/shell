#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

if [ "$1" == "hello" ]; then 
	echo "Hello, how are you ?"
elif [ "$1" == "" ]; then 
	echo "You MUST input parameters,ex> {$0 somtword}"
else
	echo "The only parameter is 'hello',ex> {$0 hello}"
fi

