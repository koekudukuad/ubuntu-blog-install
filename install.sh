#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" apache2 apache2-bin apache2-data apache2-doc apache2-mpm-prefork apache2-utils apt-utils bind9 bind9-host bind9utils binutils bsd-mailx bsdmainutils bzip2 console-common console-data console-setup cracklib-runtime cron db-util db5.3-util debconf-utils dialog expat fetchmail file finger fontconfig fontconfig-config fonts-dejavu fonts-dejavu-core fonts-dejavu-extra fonts-freefont-ttf ftp gettext groff-base info iputils-arping iputils-tracepath isc-dhcp-client isc-dhcp-common kbd keyboard-configuration ldap-utils less libapr1:amd64 libaprutil1:amd64 libaprutil1-dbd-sqlite3:amd64 libaprutil1-ldap:amd64 libapt-inst1.5:amd64 libavahi-client3:amd64 libavahi-common-data:amd64 libavahi-common3:amd64 libbind9-90 libbsd0:amd64 libcrack2:amd64 libcroco3:amd64 libcups2:amd64 libdns100 libfile-copy-recursive-perl libfontconfig1:amd64 libfreetype6:amd64 libgeoip1:amd64 libglib2.0-0:amd64 libgmp10:amd64 libgomp1:amd64 libgssglue1:amd64 libhdb9-heimdal:amd64 libisc95 libisccc90 libisccfg90 libkdc2-heimdal:amd64 libldb1:amd64 liblockfile-bin liblockfile1:amd64 libltdl7:amd64 liblwres90 libmagic1:amd64 libntdb1:amd64 libodbc1:amd64 libpaper1:amd64 libpcap0.8:amd64 libperl5.18 libpipeline1:amd64 libpopt0:amd64 libpython-stdlib:amd64 libsensors4:amd64 libsnmp-base libsnmp30:amd64 libtalloc2:amd64 libtdb1:amd64 libtevent0:amd64 libtirpc1:amd64 libunistring0:amd64 libwbclient0:amd64 libxml2:amd64 logrotate lynx lynx-cur m4 make man-db manpages memtester mlocate mtools ncurses-term odbcinst odbcinst1debian2:amd64 openssl openssl-blacklist postfix procmail psutils pwgen python python-crypto python-dnspython python-ldb python-minimal python-ntdb python-talloc python-tdb python2.7 python2.7-minimal rpcbind rsync sasl2-bin screen sharutils snmp syslinux syslinux-common tcpdump tcsh tdb-tools telnet tofrodos traceroute ttf-dejavu ttf-dejavu-core ttf-dejavu-extra ttf-freefont unixodbc update-inetd uuid-runtime whois wide-dhcpv6-client xinetd xkb-data; apt-get clean; apt-get autoremove -y


pwd=`dirname $0`

read -e -p "Target directory: " -i "/var/www" dir
dir=${dir:-"/var/www"}

read -e -p "Database: " -i "wordpress" db
db=${db:-"wordpress"}

if [ ! -d "$dir" ]; then
	sudo mkdir -p $dir
fi

sudo apt-get install -y \
	mysql-server \
	nginx \
	php5-curl \
	php5-fpm \
	php5-gd \
	php5-mysql \
	wget \
	unzip

sudo replace "2M" "10M" -- /etc/php5/fpm/php.ini
sudo service php5-fpm restart

sudo mysql -e "CREATE DATABASE IF NOT EXISTS $db;"

cd $dir
sudo wget --no-check-certificate' http://wordpress.org/latest.zip
sudo unzip latest.zip > /dev/null

sudo rm -rf wp-*/

sudo mv wordpress/* .
sudo rm -rf index.html wordpress latest.zip

sudo chown -R www-data:www-data $dir
sudo chmod -R 775 $dir

u=$SUDO_USER
if [ -z $u ]; then
	u=$USER
fi

if !(groups $u | grep >/dev/null www-data); then
	sudo adduser $u www-data
fi

cd - >/dev/null

sites="/etc/nginx/sites-enabled"

sudo cp "$pwd/conf/wordpress" $sites
sudo replace "/var/www" $dir -- "$sites/wordpress"

if [ -e "$sites/default" ]; then
	read -r -n 1 -p "Delete 'default' nginx site? (y/n)"
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sudo rm "$sites/default"
	fi
	echo ""
fi

sudo service nginx restart

echo ""
echo "Install complete!"
echo "Please restart your session."
echo ""
