#!/bin/bash

DEFAULT_DPI=96
NEW_DISPLAY=""
NEW_DPI=$DEFAULT_DPI
NORMAL_RESOLUTION="1920x1080"
#LARGER_RESOLUTION="3840x2160"
LARGER_RESOLUTION="2560x1440"
NEW_RESOLUTION=""
LARGER_DPI=192
CHANGE_DPI=0
CHANGE_SCALE=0
SCALE="1x1"
LARGER_SCALE="0.75x0.75"
ALL_DISPLAYS=($(xrandr | awk '/ (dis)?connected/{print $1}'))
CONNECTED_DISPLAYS=($(xrandr | awk '/ connected/{print $1}'))
CURRENT_DISPLAY=$(xrandr | awk '/ connected/ && /[[:digit:]]x[[:digit:]].*+/{print $1}' | head -n 1)
DEFAULT_DISPLAY=""

notify() {
	notify-send -t 10000 "$1"
}

CT=0

# Find next display.
for i in ${CONNECTED_DISPLAYS[@]}; do
	let CT=$CT+1
	if [[ $i == $CURRENT_DISPLAY ]]; then
		if [[ -n ${CONNECTED_DISPLAYS[$CT]} ]]; then
			NEW_DISPLAY=${CONNECTED_DISPLAYS[$CT]}
		else
			NEW_DISPLAY=${CONNECTED_DISPLAYS[0]}
		fi
		break
	fi
done

if [[ -z $NEW_DISPLAY ]]; then
	NEW_DISPLAY=${CONNECTED_DISPLAYS[0]}
fi

# Display.

if [[ -z $NEW_DISPLAY ]]; then
	notify "Can't determine new display."
	exit 1
fi

XRANDR_OPTS=""

# Use exact resolution for larger display.
if [[ $NEW_DISPLAY == 'DP-1' || $NEW_DISPLAY == 'HDMI-2' ]]; then
	NEW_RESOLUTION=$LARGER_RESOLUTION
	if [[ $CHANGE_SCALE == 1 ]]; then
		SCALE=$LARGER_SCALE
	fi
else
	NEW_RESOLUTION=$NORMAL_RESOLUTION
fi

XRANDR_OPTS="--mode $NEW_RESOLUTION"

notify "Enabling $NEW_DISPLAY @ $NEW_RESOLUTION (scale: $SCALE)"
xrandr --output $NEW_DISPLAY --auto $XRANDR_OPTS --scale $SCALE

# Make sure to disable other displays.
for i in ${ALL_DISPLAYS[@]}; do
	if [[ $i != $NEW_DISPLAY ]]; then
		xrandr --output "$i" --off
	fi
done

# Change DPI.
if [[ $CHANGE_DPI -eq 1 ]]; then
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
	fi
fi

sleep 1

# Restore the desktop wallpaper as it can be rendered incorrectly.
nitrogen --restore
