#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="package-update-indicator"
PKG_VER="7-1+uni1"
SHORT_VER="7"

cd $(dirname "$0")

sudo apt install -y build-essential devscripts
sudo apt build-dep -y ${PKG_NAME}

dpkg-source -x ${PKG_NAME}_${PKG_VER}.dsc

cd ${PKG_NAME}-${SHORT_VER}
debuild -uc -us
cd ..
