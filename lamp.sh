#!/bin/bash
sudo yum update -y

#install MariaDB (MySQL), Apache, PHP
#sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd git mod_wsgi

sudo yum install python3 python3-devel ea-apache24-devel
sudo pip3 install mod_wsgi

#start apache server
sudo systemctl start httpd
sudo systemctl enable httpd

#install flask
pip3 install flask

#grant ec2-user access to add files to Apache
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

#clone down config files
git clone https://github.com/BobaFettyW4p/OnlineGuestBook.git
cd OnlineGuestBook/

sudo mkdir /usr/local/FlaskApp
#create sqlite database
sudo python3 create_sqlite_table.py

mkdir /var/www/logs
mv FlaskApp /var/www/html

sudo mv basic-flask-app.conf /etc/httpd/conf.d
sudo systemctl reload httpd