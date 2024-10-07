#!/bin/bash

if [[ -e ~/.config/tint2/.nightmodeon ]]; then
    rm ~/.config/tint2/.nightmodeon
    redshift -x
else
    touch ~/.config/tint2/.nightmodeon
    redshift -P -O 4500
fi
