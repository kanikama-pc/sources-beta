#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="audience"
PKG_VER="2.7.2+r1099+pkg51~ubuntu18.04.1"
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

DSC_URL="https://launchpad.net/~elementary-os/+archive/ubuntu/stable/+sourcefiles/audience/2.7.2+r1099+pkg51~ubuntu18.04.1/audience_2.7.2+r1099+pkg51~ubuntu18.04.1.dsc"
BUILD_DEP="debhelper intltool libclutter-gst-3.0-dev libclutter-gtk-1.0-dev libgranite-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev libgtk-3-dev meson valac"

cd $(dirname "$0")

sudo apt install -y build-essential devscripts ${BUILD_DEP}

dget -u ${DSC_URL}

cd ${PKG_NAME}-${PKG_VER}
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" debian/control
debuild -uc -us
cd ..
