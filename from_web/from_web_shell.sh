# ================================JamesKid============================== 
#" @author		: JamesKid  
#" @description : Here are the note about shell from internet 
#" @change		:
#" @history		: 2014-3-17 add ping from 192.168.1.1 to 192.168.1.10
#" ======================================================================

# net
	# ping
		# ping from 192.168.1.1 to 192.168.1.10 and save it to /tmp/shuchu.txt
			touch /tmp/shuchu.txt
			for i in `seq 1 10`
			do 
			ping -c 2 192.168.0.$i >>/tmp/shuchu.txt
			done
		# ping the ip from file 
			vim ip.txt
			192.168.1.10
			192.168.1.29
			200.100.200.25
			wq
			touch /tmp/shuchu.txt
			vim ping.sh
			#!/bin/bash
			A=`cat /ip.txt`
			for B in $A
			do 
			ping -c 3 $B >>/tmp/shuchu.txt
			done




