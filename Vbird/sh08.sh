#!/bin/bash 
# Description:  this program 
# Editor:       zhangshijie 
# Email:		 406358964@qq.com 
# Version:      1.0 
# History:      2013-12-07 creat zsj

echo "Total parameter number is ==> $#"
echo "Your whole parameter is ==> '$@'"
shift #进行第一次一个变量的shift 
echo "Total parameter number is ==> $#"
echo "your whole parameter is ==> '$@'"
shift 3 # 进行第二次三个变量的shift 
echo "Total parater nubmer is ==> $#"
echo "Your whole parameter is ==> '$@'"
