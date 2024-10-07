#!/bin/bash

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

bat=$(acpi -b)
state=$(echo ${bat} | awk '{print $3}')

if [[ "$state" = "Not" ]]; then
    level=$(echo ${bat} | awk '{print $5}')
    level=${level::-1}

else
    level=$(echo ${bat} | awk '{print $4}')
    if [[ "$state" == *"Unknown"* ]]; then
        level=${level::-1}
    else
        if [[ "$level" == "100%" ]]; then
          level=${level::-1}
        else
          level=${level::-2}
        fi
    fi
fi

if [[ "$bat" == *"until"* ]]; then

    if [[ "$level" -ge "95" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-full-charging.svg
    elif [[ "$level" -ge "75" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-threefourth-charging.svg
    elif [[ "$level" -ge "35" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-half-charging.svg
    elif [[ "$level" -ge "15" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-quarter-charging.svg
    else
        echo /usr/share/tint2-theme-link/icons/bat-empty-charging.svg
    fi
else
    if [[ "$level" -ge "95" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-full.svg
    elif [[ "$level" -ge "75" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-threefourth.svg
    elif [[ "$level" -ge "35" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-half.svg
    elif [[ "$level" -ge "15" ]]; then
        echo /usr/share/tint2-theme-link/icons/bat-quarter.svg
    else
        echo /usr/share/tint2-theme-link/icons/bat-empty.svg
    fi
fi
if  [[ $1 = "-l" ]]; then
    echo ${level}%
fi
