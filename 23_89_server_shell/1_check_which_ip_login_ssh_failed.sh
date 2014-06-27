cat secure | grep Failed | awk '{print $11}' | grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | sort -n | uniq > /tmp/fail.txt

