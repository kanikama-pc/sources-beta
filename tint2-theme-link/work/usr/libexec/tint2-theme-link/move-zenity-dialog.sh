#!/bin/bash

window_title="$1"

screen_width=$(xdotool getdisplaygeometry | awk '{print $1}')
screen_height=$(xdotool getdisplaygeometry | awk '{print $2}')

while [[ -z "${window_id}" ]]; do
    window_id=$(wmctrl -lx | grep "zenity" | grep "${window_title}" | awk '{print $1}')
done

window_width=$(xdotool getwindowgeometry --shell ${window_id} | grep "WIDTH" | cut -d = -f 2)
window_height=$(xdotool getwindowgeometry --shell ${window_id} | grep "HEIGHT" | cut -d = -f 2)

xdotool windowmove --sync ${window_id} $((screen_width - window_width - 4)) $((screen_height - window_height - 68))
