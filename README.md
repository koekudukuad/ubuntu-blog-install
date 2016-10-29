This bash script will install Wordpress on your Ubuntu machine.  
_Estimated time: 1 minute_ 

clean OS

sudo apt-get remove mysql-server* apache2* php5* php* mysql* && sudo apt-get autoremove

sudo chown -R www-data:www-data *
sudo chmod -R 777 *


### Install
Copy and run this script:  

wget https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/lemp16.64.sh && chmod +x lemp16.64.sh && ./lemp16.64.sh

```git clone http://github.com/arsanto/ubuntu-blog-install.git && bash ubuntu-blog-install/install.sh```

wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/phpmyadmin && chmod +x phpmyadmin && ./phpmyadmin




wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/LAMP && chmod +x LAMP && ./LAMP

wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/lemp14.sh && chmod +x lemp14.sh && ./lemp14.sh





This script installs:
- NGINX
- PHP5 (with mysql, curl and gd support)
- MySQL
- Wordpress


Non wordpress clean mysql 

sudo apt-get remove --purge mysql-server mysql-client mysql-common

sudo apt-get autoremove

sudo apt-get autoclean
