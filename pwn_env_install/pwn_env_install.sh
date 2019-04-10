#!/bin/sh
# Date: 2019-04-10
# Author: raycp
# Description: pwn environment install script for ubuntu
# Fiel: pwn_env_install.sh

#install vim
sudo apt-get install vim
#install tmux
sudo apt-get install tmux

# install ssh
sudo apt-get install openssh-server

# some lib
sudo apt-get install bison

# build debug glibc
sudo apt-get install 
cd ~
mkdir work
cd work
for GLIBC_VERSION in '2.19' '2.23' '2.24' '2.27' '2.28'
do
	sudo mkdir -p /glibc/$GLIBC_VERSION
	wget http://mirrors.ustc.edu.cn/gnu/libc/glibc-${GLIBC_VERSION}.tar.gz
	tar xf glibc-${GLIBC_VERSION}.tar.gz
	cd glibc-${GLIBC_VERSION}
	mkdir build
	cd build
	../configure --prefix=/glibc/${GLIBC_VERSION}/ --disable-werror --enable-debug=yes
	sudo make
	sudo make install
	cd ../../
	sudo rm -rf glibc-${GLIBC_VERSION} && rm glibc-${GLIBC_VERSION}.tar.gz
done
