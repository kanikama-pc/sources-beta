#!/bin/bash

if [ ! -e ~/.config/userdirs.dirs ]; then
    xdg-user-dirs-update --force
fi

case $LANG in
  ja*) /usr/libexec/uni-desktop/l10n-ja.sh ;;
esac

start-tint2 &
(sleep 1s && pcmanfm --desktop) &
(sleep 2s && diodon) &
(sleep 3s && nm-applet) &
(sleep 4s && blueberry-tray) &
(sleep 5s && start-jgmenu -d) &
(sleep 6s && package-update-indicator) &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
