#!/bin/bash
#install dependencies
sudo yum update -y
sudo yum install -y httpd httpd-devel git python3-mod_wsgi.x86_64
sudo pip3 install flask

#start apache server, enable apache on startup
sudo systemctl start httpd
sudo systemctl enable httpd

#grant ec2-user access to add files to Apache
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

#clone down config files
git clone https://github.com/BobaFettyW4p/OnlineGuestBook.git
cd OnlineGuestBook/

#make wsgi file executable
sudo chmod 777 FlaskApp/app.wsgi

#create log files directory
mkdir /var/www/logs

#move Flask app to location to be serviced
mv FlaskApp /var/www/html

#create database, and give ownership to the apache owner and group
sudo chown apache:apache /var/www/html/FlaskApp
sudo python3 create_sqlite_table.py
sudo chown apache:apache /var/www/html/FlaskApp/database.db


#configure apache to run app, reload apache to apply changes
sudo mv basic-flask-app.conf /etc/httpd/conf.d
sudo systemctl reload httpd