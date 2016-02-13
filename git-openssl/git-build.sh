#!/bin/bash

#
# build git with an openssl curl and without gnutls on Ubuntu (14.04,)
#
# developed using debian:jessie image
#
# v0.1 - 283.3 MB
# - git  2.7.1
# - curl 7.47.0
#

GITVER=2.7.1
CURLVER=7.47.0
WORKDIR=/tmp
CURLDIR=/usr/local
GITDIR=/usr/local
SUDO=

$SUDO apt-get update && \
    $SUDO apt-get install -y --no-install-recommends \
    gcc             \
    make            \
    wget            \
    gettext         \
    binutils        \
    libssl-dev      \
    libexpat1-dev

cd /tmp
mkdir $WORKDIR

# curl
CURLNM=curl-$CURLVER
CURLWD=$WORKDIR/$CURLNM

wget --no-check-certificate -O $WORKDIR/$CURLNM.tar.gz https://curl.haxx.se/download/curl-$CURLVER.tar.gz
mkdir -p $CURLWD
tar xzf $WORKDIR/$CURLNM.tar.gz -C $CURLWD --strip-components=1

$CURLWD/configure --prefix=$CURLDIR --without-gnutls
$SUDO make -C $CURLWD
$SUDO make -C $CURLWD install

# git
GITNM=v$GITVER
GITWD=$WORKDIR/$GITNM

wget --no-check-certificate -O $WORKDIR/$GITNM.tar.gz https://codeload.github.com/git/git/tar.gz/$GITNM
mkdir -p $GITWD
tar xzf $WORKDIR/$GITNM.tar.gz -C $GITWD --strip-components=1

make -f $GITWD/Makefile prefix=$GITDIR CURLDIR=$CURLDIR NO_R_TO_GCC_LINKER=1 all
$SUDO make -C $GITWD prefix=$GITDIR CURLDIR=$CURLDIR NO_R_TO_GCC_LINKER=1 install

$SUDO apt-get purge -y \
    gcc             \
    make            \
    wget            \
    gettext         \
    binutils        \
    libssl-dev      \
    libexpat1-dev

$SUDO rm -rf /var/lib/apt/lists/*
$SUDO rm -rf /tmp/*

