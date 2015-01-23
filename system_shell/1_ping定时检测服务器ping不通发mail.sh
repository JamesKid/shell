#!/bin/sh
####################
#服务器ping测试程序
#James Qi 2013
#循环检测各台服务器，在指定的ping次数中丢失的必须小于某个设定值，如果大于则说明有问题，发邮件通知报警
#在/etc/crontab中设定本程序的执行周期
####################
#

#参数设置
COUNT=50 #每台服务器测试ping的次数
MAX=40 #其中最多无法ping通的次数
HOST=(  # 服务器ip,或域名
192.168.1.68
192.168.1.99
113.252.248.103
www.ccc.com
)

#循环检测
for ipadd in "${HOST[@]}"
do
	timing=`date +%Y/%m/%d/%H:%M:%S`
	ping $ipadd -c $COUNT > 1ping.log
	losspag=`grep "packet loss" 1ping.log |awk '{print $6}' |sed 's/%//g'`
	if [ $losspag -ge $MAX ] ;
	then
		echo  $timing > /tmp/tmp.log
		echo -n $ipadd >> /tmp/tmp.log
		echo -n "packet loss is more than $MAX of $COUNT">> /tmp/tmp.log
		#cat /root/tmp.log | mail -s "$ipadd ping packet loss is more then $MAX of $COUNT" 133xxxxxxxx@189.cn
		mutt -s "$ipadd ping packet loss is more then $MAX of $COUNT" -- 2629424100@qq.com < /tmp/tmp.log  # 以/tmp/x.txt　里的内容作为邮件内容
	else
		rm -f tmp.log
	fi
done

#　在/etc/crontab中设置：

# */6 * * * * root sh /root/checkping.sh &
#　　也就是每6分钟执行checkping.sh一次。

# 这个能对服务器的监控起到一定作用。注意有时国内到国外的线路很差，也会造成报警，我加大了ping的次数到100、最多可以丢失90次来尽量消除短暂的网络不稳带来的影响，也可以在国外某台服务器上单独运行一个这个程序来专门检测国外服务器群。

