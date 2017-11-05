#! /bin/bash

#echo "Enter names"
#read -p 'username:' user_var

#echo "You entered the following: $name1, $name2"
#echo "username:" $user_var

#read -p 'username:' user_login
#read -sp 'password:' user_pass
#echo
#echo "username:" $user_login
#sudo -i
#user_pass="Mlkmzhcmmtt"
#echo  $usersus_pass
#sudo sh -c "whoami; whoami"
#sudo bash -c "echo service nginx status"
#echo Mlkmzhcmmtt2016! | sudo -S service nginx status

pwd = $(<pwd.txt)

#echo $pwd | sudo -i -S

#echo "STOPPING NGINX SERVICE"
#sudo -S service nginx stop
#sleep 2
#echo "RESTARTING NGINX STATUS"



echo $pwd | sudo -S apt-get install software-properties-common && sudo -S add-apt-repository ppa:ondrej/php && sudo -S add-apt-repository ppa:ondrej/php && sudo -S apt-get install php7.1 && sudo -S apt-get install php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm && php --ini |grep Loaded && sudo -S apt-get update && sudo -S apt-get upgrade && sudo -S apt-get install nginx &&  sudo -S systemctl enable nginx && sudo -S systemctl start nginx && sudo -S apt-get install curl && sudo -S chown www-data /usr/share/nginx/html -R && sudo -S service nginx restart  && sudo -S apt-get install mariadb-server mariadb-client && sudo -S systemctl start mysql && sudo -S systemctl enable mysql && sudo -S mysql_secure_installation

echo ""

#echo $pwd | sudo -S service nginx start && sudo -S service nginx stop

echo "Installation was successful"

echo "Make the following changes on your php.ini configuration file. Refer to the step 5 of this link:"

echo "https://www.rosehosting.com/blog/install-php-7-1-with-nginx-on-an-ubuntu-16-04-vps/"


