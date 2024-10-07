#!/bin/bash

if [[ -e ~/.config/tint2/.nightmodeon ]]; then
    echo /usr/share/tint2-theme-link/icons/night-mode-on.svg
    mode="on "
else
    echo /usr/share/tint2-theme-link/icons/night-mode-off.svg
    mode="off"
fi

if  [[ $1 = "-l" ]]; then
    echo "${mode}"
fi
