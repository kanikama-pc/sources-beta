#!/bin/bash

if [ ! -d ~/.config/uni-desktop ]; then
    rm -rf ~/.config/uni-desktop
    mkdir -p ~/.config/uni-desktop
fi
if [ ! -e ~/.config/uni-desktop/l10n-done ]; then
    gsettings set org.freedesktop.ibus.panel xkb-icon-rgba '#ffffff'
    gsettings set org.freedesktop.ibus.general.hotkey triggers "['Zenkaku_Hankaku']"
    touch ~/.config/uni-desktop/l10n-done
    ibus restart
fi
