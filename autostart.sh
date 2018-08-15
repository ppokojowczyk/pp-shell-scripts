#!/bin/bash

#
# Start these applications :)
#

# do i need settings from GNOME ?
#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &

# nice wallpaper
feh --bg-fill ~/.config/wallpaper.jpg&

# set screens layout
xrandr --output DVI-1 --off&

# default keyboard map
setxkbmap pl&

# volume manager
xfce4-volumed&

# keys binding manager
xbindkeys&

# hide mouse cursor
unclutter&

# messangers
skypeforlinux&

# clipboards
parcellite&
xpad&

# cloud storage
dropbox start -i&

# screenshots
shutter --min_at_startup&

# launcher
#rofi&

# audio player
audacious&

