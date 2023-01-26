# nginx-server
## Install PHP 7.1 along with commonly used extensions, NGINX Web Server, MYSQL in a single command

Clone this repository

git@github.com:devchuckcamp/nginx-server.git
 
cd nginx-server/
vim pwd.txt and just write your sudoer password #will add encryption on this.
run ./limpn.sh and your good to go.



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
