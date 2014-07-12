#!/bin/bash

sudo yum -y install httpd
sudo service httpd start
sudo chkconfig httpd on

name=`hostname`
sudo echo `printf "I am %s" $name` > /var/www/html/index.html

ipaddr=`ifconfig| grep 'inet addr'| awk {'print $2'}| sed s/.*://`
sudo route del default gw 10.0.2.2
sudo route add -net default gw 10.0.0.10

sudo iptables -t nat -I PREROUTING -d 10.0.0.10 -j REDIRECT
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo service iptables save
