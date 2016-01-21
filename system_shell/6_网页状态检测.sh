#!/bin/bash  
Resettem=$(tput sgr0)
Nginxserver='http://www.frlgz.com/index.html'
Check_Nginx_Server() {
		Status_code=$(curl -m 5 -s -w %{http_code} ${Nginxserver} -o /dev/null) 
		if [ $Status_code -eq 000 -o $Status_code -ge 500 ]; then 
			echo -e '\E[32m' " check http server error! Respoinse status Code is " $Resettem $Status_code 
		else
			Http_content=$(curl -s ${Nginxserver}) 
			echo -e '\E[32m' "check server ok\n" $Resettem $Status_code 
		fi
}
Check_Nginx_Server


