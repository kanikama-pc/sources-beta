#!/bin/bash

##Author: Yamato Tanikawa <kanikama_pc@outlook.jp>
##License: MIT
##https://opensource.org/license/mit

PKG_NAME="uni-session"
PKG_VER="0.8"
PKG_ARCH="all"

cd $(dirname "$0")

fakeroot dpkg-deb -b work ${PKG_NAME}_${PKG_VER}_${PKG_ARCH}.deb
