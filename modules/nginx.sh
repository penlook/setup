#!/bin/bash
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum install -y nginx16

#wget http://nginx.org/download/nginx-1.7.3.tar.gz
#tar -xvf nginx-1.7.3.tar.gz
#cd nginx-1.7.3
#./configure --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf
#make -j4
#sudo make install
#sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
#sudo chmod +x /etc/init.d/nginx
#yum install -y redhat-lsb

