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

Once the installation is completed you need to edit the php.ini file. Find the configuration file:

php --ini |grep Loaded
Loaded Configuration File: /etc/php/7.1/cli/php.ini
Edit the file using your favorite text editor:

sudo nano /etc/php/7.1/cli/php.ini
Make the following changes:

cgi.fix_pathinfo=0
Then, restart the PHP-FPM service:

sudo systemctl restart php7.1-fpm.service, change php version accordingly.

# Post Installation
Installing Nginx on Ubuntu VPS is very easy. Run the following command to install it:

sudo apt-get install nginx
Create Nginx virtual server block for your domain name:

sudo nano /etc/nginx/sites-available/mysite.com
Paste the following content:

server {
        listen 80;
        server_name mysite.com www.mysite.com;
        root /var/www/mysite.com;
        index index.php;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            fastcgi_pass unix:/run/php/php7.1-fpm.sock;
            include snippets/fastcgi-php.conf;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }

        location ~ /\.ht {
                deny all;
        }
}
Of course, you should replace mysite.com with your actual domain name. Save and close the file. To enable the server block in Nginx you need to create a symbolic link to site-enabled. Use the following command to create a symbolic link:

sudo ln -s /etc/nginx/sites-available/mysite.com /etc/nginx/sites-enabled/mysite.com
Check if there are errors with the configuration:

sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
If the syntax is OK and there are no errors you can restart Nginx.

sudo systemctl restart nginx.service
Enable Nginx and PHP-FPM on system boot:

sudo systemctl enable nginx.service
sudo systemctl enable php7.1-fpm.service, change php version accordingly.


