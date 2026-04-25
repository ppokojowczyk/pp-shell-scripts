#!/bin/bash

MSG=""
CURRENT_DISPLAY=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')
NEW_DISPLAY="DP-1"
NEW_DPI=144

notify () {
    notify-send -t 10000 "$1"
}

# Display.

if [[ $CURRENT_DISPLAY == 'DP-1' ]];then
    NEW_DISPLAY="eDP-1"
fi

if [[ -z $NEW_DPI || -z $NEW_DISPLAY ]]; then
    notify "Can't determine new display or DPI."
    exit 1
fi

if [[ $NEW_DISPLAY == $CURRENT_DISPLAY ]]; then
    return 0
fi

notify "Enabling $NEW_DISPLAY"
xrandr --output $CURRENT_DISPLAY --off
xrandr --output $NEW_DISPLAY --auto

# DPI.

X_RES=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $4}' | sed 's/\([[:digit:]]*\).*/\1/')

if [[ -z $X_RES ]]; then
    notify "Can't determine new X resolution."
fi

if [[ -n $X_RES && $X_RES -gt 1920 ]]; then
    NEW_DPI=192
fi

echo "Xft.dpi: $NEW_DPI" | xrdb -override -

notify "New DPI: $NEW_DPI"

