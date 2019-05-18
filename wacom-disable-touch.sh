#!/bin/bash

#
# Disable touch function on all connected Wacom tablets using xsetwacom.
#

if [ -z `command -v xsetwacom` ]; then
    echo 'Binary not found';
    exit 0;
fi

LOOK_FOR='id:.*type: TOUCH';
USE='xsetwacom --set [[DEVICE_ID]] touch off';
WACOM_DEVICE_ID=`xsetwacom --list devices | awk '/'"$LOOK_FOR"'/ {print $8}'`;

if [ -n $WACOM_DEVICE_ID ]; then
    for ID in $WACOM_DEVICE_ID; do
        `echo $USE | sed -e "s/\[\[DEVICE_ID\]\]/$ID/"`;
    done
fi;

