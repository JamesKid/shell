#!/bin/bash  
Resettem=$(tput sgr0)
Nginxserver='http://www.frlgz.com/index.html'
# 检查页面状态
Check_Nginx_Server() {
		Status_code=$(curl -m 5 -s -w %{http_code} ${Nginxserver} -o /dev/null) 
		if [ $Status_code -eq 000 -o $Status_code -ge 500 ]; then 
			echo -e '\E[32m' " check http server error! Respoinse status Code is " $Resettem $Status_code 
		else
			Http_content=$(curl -s ${Nginxserver}) 
			echo -e '\E[32m' "check server ok\n" $Resettem $Status_code 
		fi
}
# 检查数据库状态
Mysql_Slave_Server='23.252.110.206'
Mysql_User='gameiboy' 
Mysql_Password='test' 
Check_Mysql_Server() {
		nc -z -w2 ${Mysql_Slave_Server} 3306 &>/dev/null  # 添加 &>/dev/null 表示不输出
		if [ $? -eq 0 ]; then 
			echo "Connect ${Mysql_Slave_Server} OK! "
			mysql -u${Mysql_User} -p${Mysql_Password} -h ${Mysql_Slave_Server} -e "show slave status\G" | grep "Slave_IO_Running" | awk '{if($2!="Yes"){print " Slave thread not running! ";exit 1 }}'  # 检查主从Slave_IO_Running是否运行
			if [ $? -eq 0 ]; then 
				mysql -u${Mysql_User} -p${Mysql_Password} -h ${Mysql_Slave_Server} -e "show slave status\G" | grep "Seconds_Behind_Master" # 检查是否有延迟
			fi
		else 
				echo "connect Mysql server not succeeded" 
		fi
}
Check_Mysql_Server  # 执行数据库检查函数
Check_Nginx_Server  # 执行服务器检查函数


