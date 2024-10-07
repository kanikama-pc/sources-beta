#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="tint2"
PKG_VER="16.7-1"
VER_SUFFIX="+uni1"
PKG_ARCH="amd64"
#SOURCE_URL=""
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

cd $(dirname "$0")

apt download ${PKG_NAME}=${PKG_VER}
#wget ${SOURCE_URL}

dpkg -x ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work
dpkg -e ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work/DEBIAN

rm -r work/usr/share/applications

sed -i "s/Version:.*/&${VER_SUFFIX}/" work/DEBIAN/control
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" work/DEBIAN/control

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}${VER_SUFFIX}_${PKG_ARCH}.deb
