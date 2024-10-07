#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="mintstick"
PKG_VER="1.5.6"
VER_SUFFIX="+uni1"
PKG_ARCH="all"
SOURCE_URL="http://packages.linuxmint.com/pool/main/m/mintstick/mintstick_1.5.6_all.deb"
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

cd $(dirname "$0")

wget ${SOURCE_URL}

dpkg -x ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work
dpkg -e ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work/DEBIAN

rm work/usr/share/applications/mintstick-kde.desktop
rm work/usr/share/applications/mintstick-format-kde.desktop

sed -i "s/Version:.*/&${VER_SUFFIX}/" work/DEBIAN/control
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" work/DEBIAN/control

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}${VER_SUFFIX}_${PKG_ARCH}.deb
