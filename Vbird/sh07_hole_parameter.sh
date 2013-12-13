#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

echo "The script name is  ==> $0"
echo "Total parameter number is ==> $#" 
[ "$#" -lt 2 ] && echo "The number of parameter is less than 2. Stop here." && exit 0 
echo "Your whole parameter is ==> '$@'"
echo "The 1st parameter ==> $1"
echo "The 2nd parameter ==> $2"
