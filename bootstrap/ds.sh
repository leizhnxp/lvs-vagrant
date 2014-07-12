#!/bin/bash

sudo yum -y install ipvsadm
sudo sysctl -w net.ipv4.ip_forward=1
sudo ip addr add 10.0.0.10 label eth1:vip dev eth1

sudo ipvsadm -A -t 10.0.0.10:80 -s rr
sudo ipvsadm -a -t 10.0.0.10:80 -r 10.0.0.20:80 -g
sudo ipvsadm -a -t 10.0.0.10:80 -r 10.0.0.21:80 -g

sudo service ipvsadm save
sudo chkconfig ipvsadm on

sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo service iptables save
