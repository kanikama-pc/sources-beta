#!/bin/bash

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

bri=$(echo "($(light -G)+0.5)/1" | bc)

if [[ "$bri" -gt "90" ]]; then
    echo /usr/share/tint2-theme-link/icons/bri-full.svg
elif [[ "$bri" -gt "50" ]]; then
    echo /usr/share/tint2-theme-link/icons/bri-high.svg
elif [[ "$bri" -gt "30" ]]; then
    echo /usr/share/tint2-theme-link/icons/bri-medium.svg
else
    echo /usr/share/tint2-theme-link/icons/bri-low.svg
fi
if  [[ $1 = "-l" ]]; then
    echo ${bri}%
fi
