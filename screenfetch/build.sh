#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="screenfetch"
PKG_VER="3.9.1-2"
VER_SUFFIX="+uni1"
PKG_ARCH="all"
#SOURCE_URL=""
MAINTAINER_NAME="Yamato Tanikawa"
MAINTAINER_MAIL="kanikama_pc@outlook.jp"

cd $(dirname "$0")

apt download ${PKG_NAME}=${PKG_VER}
#wget ${SOURCE_URL}

dpkg -x ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work
dpkg -e ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb work/DEBIAN

cd work
mkdir usr/libexec
mv usr/bin/screenfetch usr/libexec/screenfetch
cat << 'EOT' > usr/bin/screenfetch
#!/bin/bash
distro=$(cat /etc/os-release | grep PRETTY_NAME= | cut -d \" -f 2)
/usr/libexec/screenfetch -D "${distro}" "$@"
EOT
chmod +x usr/bin/screenfetch
cd ..

sed -i "s/Version:.*/&${VER_SUFFIX}/" work/DEBIAN/control
sed -i "s/Maintainer:.*/Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_MAIL}>/" work/DEBIAN/control

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}${VER_SUFFIX}_${PKG_ARCH}.deb
