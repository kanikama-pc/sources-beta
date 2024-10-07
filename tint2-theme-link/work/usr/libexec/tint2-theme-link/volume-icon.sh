#!/bin/bash

# Authors: Piotr Miller, @natemaia
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

if [[ "$(amixer sget Master | awk -F'[][]' '/Right:|Mono:/ && NF > 1 {print $4}')" = "on" ]]; then

    vol=$(amixer sget Master | awk -F'[][]' '/Right:|Mono:/ && NF > 1 {sub(/%/, ""); printf "%0.0f\n", $2}')

    if [[ ${vol} -ge 90 ]]; then
        echo /usr/share/tint2-theme-link/icons/vol-full.svg
    elif [[ ${vol} -ge 40 ]]; then
        echo /usr/share/tint2-theme-link/icons/vol-medium.svg
    elif [[ ${vol} -ge 10 ]]; then
        echo /usr/share/tint2-theme-link/icons/vol-low.svg
    else
        echo /usr/share/tint2-theme-link/icons/vol-lowest.svg
    fi
    if  [[ $1 = "-l" ]]; then
        echo ${vol}%
    fi
else
    echo /usr/share/tint2-theme-link/icons/vol-muted.svg
fi
