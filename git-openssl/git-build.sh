#!/bin/bash

#
# build git with an openssl curl and without gnutls on Ubuntu (14.04,)
#

GITVER=2.7.1
CURLVER=7.47.0
SUDO=sudo
WORKDIR=/tmp
CURLDIR=/usr/local
GITDIR=/usr/local
LD_LIBRARY_PATH=$CURLDIR/lib:$LD_LIBRARY_PATH

$SUDO apt-get update && \
$SUDO apt-get install -y \
	libssl-dev \
	libexpat1-dev \
	gettext

$mkdir $WORKDIR 

# curl
cd $WORKDIR
curl -o curl-$CURLVER.tar.gz https://curl.haxx.se/download/curl-$CURLVER.tar.gz
tar xzf curl-$CURLVER.tar.gz
cd curl-$CURLVER

./configure --prefix=$CURLDIR --libdir=/usr/lib/x86_64-linux-gnu --without-gnutls
$SUDO make install

# git
cd $WORKDIR
curl -o v$GITVER.tar.gz https://github.com/git/git/archive/v$GITVER.tar.gz
tar xzf v$GITVER.tar.gz
cd git-$GITVER

make prefix=$GITDIR CURLDIR=/usr/local NO_R_TO_GCC_LINKER=1 all
$SUDO make prefix=$GITDIR CURLDIR=/usr/local NO_R_TO_GCC_LINKER=1 install

$SUDO ldconfig

