This bash script will install Wordpress on your Ubuntu machine.  
_Estimated time: 1 minute_ 

### Install
Copy and run this script:  
```git clone http://github.com/arsanto/ubuntu-blog-install.git && bash ubuntu-blog-install/install.sh```

wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/phpmyadmin && chmod +x phpmyadmin && ./phpmyadmin

wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/LAMP && chmod +x LAMP && ./LAMP
This script installs:
- NGINX
- PHP5 (with mysql, curl and gd support)
- MySQL
- Wordpress


Non wordpress clean mysql 

sudo apt-get remove --purge mysql-server mysql-client mysql-common

sudo apt-get autoremove

sudo apt-get autoclean
