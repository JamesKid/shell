#!/bin/bash 
# Description:  this program is to show if the file exist ,if exist print it's "read,write,executable" propert#				  y
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

# 1.让使用者输入档名，并且判断使用者是否真的有输入字符串？
echo -e "Please input a filename,I will check the filename's type and permission. \n\n"

read -p "Input a filename:" filename
test -z $filename && echo "You MUST input a filename." && exit 0 

# 2.判断档案是否存在？若不存在则显示讯息并结束脚本
test ! -e $filename && echo "The filename '$filename' DO NOT exist" && exit 0 

# 3.开始判断文件类型与属性
test -f $filename && filetype="regulare file"
test -d $filename && filetype="directory "
test -r $filename && perm="readable" 
test -w $filename && perm="$perm writable"
test -x $filename && perm="$perm executable"

echo "The filename:$filename is a $filetype"
echo "And the permissions are: $perm"

