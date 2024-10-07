#!/bin/bash

if [ ! -d ~/.config/jgmenu ]; then
    rm -rf ~/.config/jgmenu
    mkdir -p ~/.config/jgmenu
fi
if [ ! -e ~/.config/jgmenu/jgmenurc ]; then
    cp /etc/jgmenu-theme-link/jgmenurc ~/.config/jgmenu/
fi
if [ ! -e ~/.config/jgmenu/prepend.csv ]; then
    /usr/libexec/jgmenu-theme-link/translate.sh
fi

while true; do
    rm ~/.jgmenu-lockfile
    jgmenu --hide-on-startup
    sleep 1s
done
