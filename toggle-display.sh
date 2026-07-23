#!/bin/bash

DEFAULT_DPI=96
NEW_DISPLAY=""
NEW_DPI=$DEFAULT_DPI
NORMAL_RESOLUTION="1920x1080"
LARGER_RESOLUTION="3840x2160"
NEW_RESOLUTION=""
LARGER_DPI=192
SCALE=""
NORMAL_SCALE="1x1"
LARGER_SCALE="0.75x0.75"
#LARGER_DPI=144
ALL_DISPLAYS=($(xrandr | awk '/ connected/{print $1}'))
CURRENT_DISPLAY=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}')
DEFAULT_DISPLAY=""

notify () {
    notify-send -t 10000 "$1"
}

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

XRANDR_OPTS=""

if [[ $NEW_DISPLAY == 'DP-1' ]]; then
    NEW_RESOLUTION=$LARGER_RESOLUTION
    SCALE=$LARGER_SCALE
else
    NEW_RESOLUTION=$NORMAL_RESOLUTION
    SCALE=$NORMAL_SCALE
fi

XRANDR_OPTS="--mode $NEW_RESOLUTION"

notify "Enabling $NEW_DISPLAY @ $NEW_RESOLUTION (scale: $SCALE)"
xrandr --output $NEW_DISPLAY --auto $XRANDR_OPTS --scale $SCALE
sleep 1
xrandr --output $CURRENT_DISPLAY --off

# Do not change DPI.
exit 0

# Change DPI.
sleep 1
if [ $XDG_SESSION_DESKTOP == 'i3' ]; then
    X_RES=$(xrandr | awk '/\*/ {split($1,a,"x"); print a[1]}')

    if [[ -z $X_RES ]]; then
        notify "Can't determine new X resolution."
    fi

    if [[ -n $X_RES && $X_RES -gt 1920 ]]; then
        NEW_DPI=$LARGER_DPI
    fi

    echo "Xft.dpi: $NEW_DPI" | xrdb -override -

    notify "New DPI: $NEW_DPI"
    sleep 4
    nitrogen --restore # Restore the desktop wallpaper as it can be rendered incorrectly.
fi

