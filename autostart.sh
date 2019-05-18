#!/bin/bash

#
# Start these applications
#

# do i need settings from GNOME ?
#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &

# set screens layout
xrandr --output DVI-1 --off &

# nice wallpaper
# feh --bg-fill ~/.config/wallpaper.jpg &
nitrogen --restore &

# default keyboard map
setxkbmap pl &

# volume manager
xfce4-volumed &

# keys binding manager
xbindkeys &

# hide mouse cursor
unclutter &

# messangers
skypeforlinux &

# clipboards
parcellite &
xpad &

# cloud storage
dropbox start -i &

# screenshots
shutter --min_at_startup&

# launcher
#rofi&

# audio player
clementine &

# bluetooth manager
blueman-applet &

# nm-applet
nm-applet &

# set up Wacom tablet
wacom-gimp-hotkeys.sh &
wacom-disable-touch.sh &

# redshift for eye-strain
redshift-gtk &

# wallpaper switcher
# variety &

# compositor
compton &

