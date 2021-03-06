#!/bin/bash
#update centos
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen

#Apache
yum install httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

#PHP
yum install -y php php-cli php-common php-devel php-mysql 

#MySQL
yum install -y mysql mysql server mysql-devel
chkconfig -add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES;"

#Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/walks84/vagrant/master/files/index.html

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/walks84/vagrant/master/files/info.php

service httpd restart