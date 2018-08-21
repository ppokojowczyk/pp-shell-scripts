#!/bin/bash

#
# Setup key bindings for GIMP
#

if [ -z `command -v xsetwacom` ]; then
    echo 'Binary not found';
    exit 0;
fi

LOOK_FOR='id: ..\ttype: PAD';
USE='xsetwacom --set [[DEVICE_ID]] touch off';
WACOM_DEVICE_ID=`xsetwacom --list devices | awk '/'"$LOOK_FOR"'/ {print $8}'`;

function setWacomButton {
    CM="xsetwacom --set $WACOM_DEVICE_ID $1 $2";
    echo $CM;
    $CM;
}

if [ -n $WACOM_DEVICE_ID ]; then
    setWacomButton "Button 1" "key +shift +ctrl j -shift -ctrl" # Fit to Window
    setWacomButton "Button 2" "key ctrl" # CTRL modifier
    setWacomButton "Button 3" "key s" # Smudge Tool
    setWacomButton "Button 8" "key z" # Zoom
    setWacomButton "Button 9" "key x" # Switch colors
    setWacomButton "Button 10" "key p" # Paintbrush Tool
    setWacomButton "Button 11" "key +shift e -shift" # Eraser
    setWacomButton "Button 12" "key a" # Airbrush Tool
    setWacomButton "Button 13" "key f" # Free Select Tool
    setWacomButton "AbsWheelDown" "key ]" # Increase brush size
    setWacomButton "AbsWheelUp" "key [" # Decrease brush size
fi;



