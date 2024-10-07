#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="clamtk"
PKG_VER="6.03-3"
VER_SUFFIX="+uni1"
PKG_ARCH="all"
#SOURCE_URL=""
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

cd $(dirname "$0")

apt download ${PKG_NAME}=${PKG_VER}

dpkg -x ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work
dpkg -e ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work/DEBIAN

cd work
rm -r usr/share/applications/clamtk-kde.desktop
patch -p1 < ../fix-locale-time.patch
patch -p1 < ../scan-mail-yes.patch
cd ..

sed -i "s/Version:.*/&${VER_SUFFIX}/" work/DEBIAN/control
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" work/DEBIAN/control
sed -i "s/gnome-icon-theme/papirus-icon-theme/" work/DEBIAN/control

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}${VER_SUFFIX}_${PKG_ARCH}.deb
