#!/bin/bash

icon="/usr/share/icons/Papirus/48x48/apps/multimedia-volume-control.svg"

case $LANG in
  ja*) title="ボリューム" ; text="音量を設定します。" ;;
    *) title="Volume" ; text="Set master volume level" ;;
esac

/usr/libexec/tint2-theme-link/move-zenity-dialog.sh "${title}" &

lvl=$(amixer sget Master | awk -F'[][]' '/Right:|Mono:/ && NF > 1 {sub(/%/, ""); printf "%0.0f\n", $2}')

lvl=$( \
    zenity \
    --scale \
    --value="${lvl}" \
    --text="${text}" \
    --title="${title}" \
    --window-icon="${icon}" \
)

amixer sset Master ${lvl}% unmute -q
