#!/bin/bash

case $LANG in
  ja*) cp /usr/share/jgmenu-theme-link/translations/ja.csv ~/.config/jgmenu/prepend.csv ;;
    *) cp /usr/share/jgmenu-theme-link/translations/en.csv ~/.config/jgmenu/prepend.csv ;;
esac
