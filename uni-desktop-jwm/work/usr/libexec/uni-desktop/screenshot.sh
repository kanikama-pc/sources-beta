#!/bin/bash

ssdir="$(xdg-user-dir PICTURES)/screenshot"

if [ ! -d ${ssdir} ]; then
    rm -rf ${ssdir}
    mkdir ${ssdir}
fi

case $1 in
  --fullscreen) scrot -q 100 ${ssdir}/screenshot.png ;;
  --focused) scrot -q 100 -u ${ssdir}/screenshot.png ;;
  --select) scrot -q 100 -s ${ssdir}/screenshot.png ;;
esac
