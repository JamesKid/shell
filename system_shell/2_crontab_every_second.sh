#!/bin/bash  
step=2 #间隔的秒数，不能大于60  
for (( i = 0; i < 60; i=(i+step) )); do  
		cd /var/www/team/teach/teach
		git pull origin master
		echo "abcd" >> /tmp/crontab.txt
	sleep $step  
done  
exit 0  
