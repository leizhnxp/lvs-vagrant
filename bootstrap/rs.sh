#!/bin/bash

sudo yum -y install httpd
sudo service httpd start
sudo chkconfig httpd on

name=`hostname`
sudo echo `printf "I am %s" $name` > /var/www/html/index.html

sudo iptables -t nat -I PREROUTING -d 10.0.0.10 -j REDIRECT
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo service iptables save
