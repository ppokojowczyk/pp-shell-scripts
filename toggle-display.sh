#!/bin/bash

DEFAULT_DPI=96
NEW_DISPLAY=""
NEW_DPI=$DEFAULT_DPI
#LARGER_DPI=144
LARGER_DPI=192
ALL_DISPLAYS=($(xrandr | awk '/ connected/{print $1}'))
CURRENT_DISPLAY=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')
DEFAULT_DISPLAY=""

notify () {
    notify-send -t 10000 "$1"
}

#CURRENT_DISPLAY="HDMI7"
#ALL_DISPLAYS=(
#    DP1
#    CRT2
#    HDMI7
#    DP34
#    CRT-01
#);
CT=0

# Find next display.
for i in ${ALL_DISPLAYS[@]}; do
    let CT=$CT+1
    if [[ $i == $CURRENT_DISPLAY ]]; then
        if [[ -n ${ALL_DISPLAYS[$CT]} ]]; then
            NEW_DISPLAY=${ALL_DISPLAYS[$CT]}
        else
            NEW_DISPLAY=${ALL_DISPLAYS[0]}
        fi
        break
    fi
done

if [[ -z $NEW_DISPLAY ]]; then
    NEW_DISPLAY=${ALL_DISPLAYS[0]}
fi

# Display.

if [[ -z $NEW_DISPLAY ]]; then
    notify "Can't determine new display."
    exit 1
fi

notify "Enabling $NEW_DISPLAY"
xrandr --output $CURRENT_DISPLAY --off
xrandr --output $NEW_DISPLAY --auto

# DPI.

if [ $XDG_SESSION_DESKTOP == 'i3' ]; then
    X_RES=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $4}' | sed 's/\([[:digit:]]*\).*/\1/')

    if [[ -z $X_RES ]]; then
        notify "Can't determine new X resolution."
    fi

    if [[ -n $X_RES && $X_RES -gt 1920 ]]; then
        NEW_DPI=$LARGER_DPI
    fi

    echo "Xft.dpi: $NEW_DPI" | xrdb -override -

    notify "New DPI: $NEW_DPI"
    nitrogen --restore # Restore the desktop wallpaper as it can be rendered incorrectly.
fi

