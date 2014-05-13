#!/bin/sh
yum install -y ppp iptables make gcc gmp-devel xmlto bison flex xmlto libpcap-devel lsof unzip
wget http://lieat.com/openswan-2.6.41.tar.gz
tar zxvf openswan-2.6.41.tar.gz
cd openswan-2.6.41
make programs install
rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/5/i386/epel-release-5-4.noarch.rpm
rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/5/x86_64/epel-release-5-4.noarch.rpm
rpm -ivh http://poptop.sourceforge.net/yum/stable/rhel5/pptp-release-current.noarch.rpm
rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh http://poptop.sourceforge.net/yum/stable/rhel6/pptp-release-current.noarch.rpm
yum install pptpd -y
yum install xl2tpd -y
cp /etc/ppp/options.pptpd /etc/ppp/options.pptpd.old
cat >>/etc/pptpd.conf<<EOF
localip 172.16.16.1
remoteip 172.16.16.2-254
EOF
cat >/etc/ppp/options.pptpd<<EOF
name pptpd
refuse-pap
refuse-chap
refuse-mschap
#require-mppe-128
require-mschap-v2
ms-dns 8.8.8.8
ms-dns 8.8.4.4
proxyarp
debug
dump
lock
nobsdcomp
novj
novjccomp
logfile /etc/ppp/link.log
EOF
echo "test * test *" >> /etc/ppp/chap-secrets	
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf
sed -i 's/net.ipv4.tcp_syncookies = 1/#net.ipv4.tcp_syncookies = 1/g' /etc/sysctl.conf
sysctl -p
cat >/etc/ipsec.conf<<EOF
config setup
    nat_traversal=yes
    virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12
    oe=off
    protostack=netkey
 
conn L2TP-PSK-NAT
    rightsubnet=vhost:%priv
    also=L2TP-PSK-noNAT
 
conn L2TP-PSK-noNAT
    authby=secret
    pfs=no
    auto=add
    keyingtries=3
    rekey=no
    ikelifetime=8h
    keylife=1h
    type=transport
    left=`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk 'NR==1 { print $1}'`
    leftprotoport=17/1701
    right=%any
    rightprotoport=17/%any
EOF
echo "`ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk 'NR==1 { print $1}'` %any: PSK \"l2tp\"" >/etc/ipsec.d/l2tp.secrets
service ipsec start
for each in /proc/sys/net/ipv4/conf/*
do
echo 0 > $each/accept_redirects
echo 0 > $each/send_redirects
done
ipsec verify
cat >/etc/xl2tpd/xl2tpd.conf<<EOF
[global]
ipsec saref = no
[lns default]
ip range = 172.16.17.2-254
local ip = 172.16.17.1
refuse chap = yes
refuse pap = yes
require authentication = yes
ppp debug = yes
pppoptfile = /etc/ppp/options.xl2tpd
length bit = yes
EOF
cat >/etc/ppp/options.xl2tpd<<EOF
require-mschap-v2
ms-dns 8.8.8.8
ms-dns 8.8.4.4
asyncmap 0
auth
crtscts
lock
hide-password
modem
debug
name l2tpd
proxyarp
lcp-echo-interval 30
lcp-echo-failure 4
logfile /etc/ppp/l2tpd.log
EOF
#iptables -t nat -A POSTROUTING -s 172.16.17.0/25 -o eth0 -j MASQUERADE
iptables -A INPUT -p gre -j ACCEPT
iptables -A INPUT -p tcp --dport 1723 -j ACCEPT
iptables -A INPUT -p tcp --dport 47 -j ACCEPT
iptables -A INPUT -p udp --dport 1701 -j ACCEPT
iptables -A INPUT -p udp --dport 500 -j ACCEPT
iptables -A INPUT -p udp --dport 4500 -j ACCEPT
iptables -t nat -A POSTROUTING -s 172.16.17.0/24 -j SNAT --to-source `ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk 'NR==1 { print $1}'`
iptables -t nat -A POSTROUTING -s 172.16.16.0/24 -j SNAT --to-source `ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk 'NR==1 { print $1}'`
service iptables save
service iptables restart
service xl2tpd restart
service pptpd start
chkconfig xl2tpd on
chkconfig iptables on
chkconfig ipsec on
chkconfig pptpd on
