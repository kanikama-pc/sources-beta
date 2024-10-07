#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="grub-theme-link"
PKG_VER="1.0"

cd $(dirname "$0")

sudo apt install -y build-essential devscripts debhelper

dpkg-source -x ${PKG_NAME}_${PKG_VER}.dsc

cd ${PKG_NAME}-${PKG_VER}
debuild -uc -us
cd ..
