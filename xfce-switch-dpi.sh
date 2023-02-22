#!/bin/bash
set -e
DEFAULT_DPI=-1
OTHER_DPI=144
CURRENT_DPI=$(xfconf-query --channel xsettings -p /Xft/DPI)
NEW_DPI=`[[ $CURRENT_DPI -eq $DEFAULT_DPI ]] && echo $OTHER_DPI || echo $DEFAULT_DPI`
xfconf-query --channel xsettings -p /Xft/DPI -s $NEW_DPI

