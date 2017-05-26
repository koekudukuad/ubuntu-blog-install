nano /etc/apt/sources.list

cd error


php5 fpm easting cpu


setting di 

/etc/php5/fpm/pool.d


pm = ondemand


pm.max_children = 2



find /var/log -type f -delete


find /usr/share/nginx/cache -type f -delete

find /var/www/nginx-cache -type f -delete




This bash script will install Wordpress on your Ubuntu machine.  
_Estimated time: 1 minute_ 

clean OS

sudo apt-get remove mysql-server* apache2* php5* php* mysql* && sudo apt-get autoremove

sudo chown -R www-data:www-data *



### Install
Copy and run this script:  



wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/phpmyadmin && chmod +x phpmyadmin && ./phpmyadmin




wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/LAMP && chmod +x LAMP && ./LAMP



wget --no-check-certificate  https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/ubuntu14-64 && chmod +x ubuntu14-64 && ./ubuntu14-64


This script installs:
- NGINX
- PHP5 (with mysql, curl and gd support)
- MySQL
- Wordpress


Non wordpress clean mysql 

sudo apt-get remove --purge mysql-server mysql-client mysql-common

sudo apt-get autoremove

sudo apt-get autoclean
