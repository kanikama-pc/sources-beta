#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="p7zip"
SHORT_VER="16.02+dfsg"
DSC_URL="https://launchpad.net/~japaneseteam/+archive/ubuntu/ppa/+sourcefiles/p7zip/16.02+dfsg-8build0ppa7/p7zip_16.02+dfsg-8build0ppa7.dsc"
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

cd $(dirname "$0")

sudo apt install -y build-essential devscripts
sudo apt build-dep -y ${PKG_NAME}

dget -u ${DSC_URL}

cd ${PKG_NAME}-${SHORT_VER}
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" debian/control
debuild -uc -us
cd ..
