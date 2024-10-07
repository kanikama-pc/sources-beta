#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="pantheon-calculator"
PKG_VER="1.6.0+r781+pkg35~ubuntu5.1.7.1"
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

DSC_URL="https://launchpad.net/~elementary-os/+archive/ubuntu/stable/+sourcefiles/pantheon-calculator/1.6.0+r781+pkg35~ubuntu5.1.7.1/pantheon-calculator_1.6.0+r781+pkg35~ubuntu5.1.7.1.dsc"
BUILD_DEP="debhelper gettext libgranite-dev libgtk-3-dev meson valac"

cd $(dirname "$0")

sudo apt install -y build-essential devscripts ${BUILD_DEP}

dget -u ${DSC_URL}

cd ${PKG_NAME}-${PKG_VER}
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" debian/control
debuild -uc -us
cd ..
