#!/bin/bash
sudo yum update -y

#install MariaDB (MySQL), Apache, PHP
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd unixODBC.x86_64 sqlite3 git mod_wsgi

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

python3 create_sqlite_table.py

mkdir /var/www/html/FlaskApp
mv FlaskApp /var/www/html/FlaskApp