#!/bin/sh

# List all installed packages
# dpkg --get-selections | grep -v deinstall

# REMOVE ALL COMPONENT
USER=`whoami`
sudo rm -rf /home/root/*
sudo rm -rf /home/$USER/*
sudo apt-get -y --force-yes autoremove python3* java* ruby* ruby1.9.1* apache2* apache2-* vim-* golang-* cpp-* ftp
sudo apt-get -y --force-yes autoremove binutils libcloog-isl4 libfreetype6 libgmp10 libisl10 libmpc3 libmpfr4 os-prober
sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches'

# INSTALL ESSENTIAL
sudo apt-get update
sudo apt-get -y install tcl8.5 build-essential

# INSTALL REDIS
sudo apt-get -y install redis-server

# INSTALL NGINX
sudo apt-get -y install nginx php5-fpm

# INSTALL PHALCON
sudo apt-get install -y php5-dev libpcre3 libpcre3-dev

mkdir -p /usr/local/src
sudo chmod a+w /usr/local/src -R

cd /tmp
git clone --depth=1 git://github.com/phalcon/cphalcon.git
cd cphalcon/build
sudo ./install
PHALCON_INI=/etc/php5/cli/conf.d/90-phalcon.ini
sudo touch $PHALCON_INI
sudo chmod a+w $PHALCON_INI
echo "extension=phalcon.so;" > $PHALCON_INI

sudo service php5-fpm restart

# INSTALL PHALCON TOOLS
cd /usr/local/src
git clone https://github.com/phalcon/phalcon-devtools
cd phalcon-devtools
sudo ./phalcon.sh
sudo rm -rf /usr/bin/phalcon
sudo ln -s /usr/local/src/phalcon-devtools/phalcon.php /usr/bin/phalcon

sudo rm -rf /tmp/*
sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches'


# INSTALL ZEPHIR
sudo apt-get -y install re2c libpcre3 libpcre3-dev

cd /usr/local/src
git clone https://github.com/phalcon/zephir.git --recursive --depth=1 -b master
cd zephir

cd json-c
sh autogen.sh
./configure
make && sudo make install
cd ..

./install -c
sudo rm -rf /usr/bin/zephir
sudo ln -s /usr/local/bin/zephir /usr/bin/zephir
sudo sh -c 'echo 1 >/proc/sys/vm/drop_caches'