
================================================================

error dpkg was interrupted

sudo apt-get update; sudo apt-get autoclean; sudo apt-get upgrade; sudo apt-get autoremove

================================================================
after install iso dan gak bisa login

sudo passwd root

sed -i 's/without-password/yes/' /etc/ssh/sshd_config

sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config

/etc/init.d/ssh restart

atau 

Login, and edit this file: sudo nano /etc/ssh/sshd_config

Find this line: PermitRootLogin without-password

Edit: PermitRootLogin yes

Close and save file

reboot or restart sshd service using: /etc/init.d/ssh restart


================================================================




wget https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/maldet && chmod +x maldet && ./maldet

#block

sudo wget  https://raw.githubusercontent.com/mariusv/nginx-badbot-blocker/master/blockips.conf -O /etc/nginx/conf.d/blockips.conf


sudo wget https://raw.githubusercontent.com/mariusv/nginx-badbot-blocker/master/blacklist.conf -O /etc/nginx/conf.d/blacklist.conf


===================================

#check folder size 

du -sh /*


===================================


#disable ipv6 update

nano /etc/apt/apt.conf.d/99force-ipv4

Acquire::ForceIPv4 "true";


===================================


nano /etc/apt/sources.list

cd error

============================

php5 fpm easting cpu


setting di 

/etc/php5/fpm/pool.d


pm = ondemand


pm.max_children = 2

==============================

find /var/log -type f -delete


find /usr/share/nginx/cache -type f -delete

find /var/www/nginx-cache -type f -delete

=================================


sudo: unable to resolve host localhost.localdomain
#tambahi spasi after cut -d\ 

echo $(hostname -I | cut -d\    -f1) $(hostname) | sudo tee -a /etc/hosts






clean OS

apt-get remove --purge -y apache2* apache* php* mysql* ubuntu-release-upgrader-core && apt-get autoremove

sudo chown -R www-data:www-data *



### Install

backupdb

wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/backupdb.sh && chmod +x backupdb && ./backupdb
Copy and run this script:  
ee ioncube php 5.5

wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/ioncube-php5.5 && chmod +x ioncube-php5.5 && ./ioncube-php5.5


ee ioncube php 5.6


wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/ee_ioncube && chmod +x ee_ioncube && ./ee_ioncube





wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/phpmyadmin && chmod +x phpmyadmin && ./phpmyadmin




wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/LAMP && chmod +x LAMP && ./LAMP


wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/ubuntu14-64-php56 && chmod +x ubuntu14-64-php56 && ./ubuntu14-64-php56

wget --no-check-certificate  https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/ubuntu14-64 && chmod +x ubuntu14-64 && ./ubuntu14-64


wget --no-check-certificate https://raw.githubusercontent.com/arsanto/ubuntu-blog-install/master/ubuntu-16-php7 && chmod +x ubuntu-16-php7 && ./ubuntu-16-php7



This script installs:
- NGINX
- PHP5 (with mysql, curl and gd support)
- MySQL
- Wordpress


Non wordpress clean mysql 

sudo apt-get remove --purge mysql-server mysql-client mysql-common

sudo apt-get autoremove

sudo apt-get autoclean
