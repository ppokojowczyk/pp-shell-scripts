#!/bin/bash

#
# Script installs all software I need
#

# Packages to be installed
PACKAGES='vsftpd git unrar unace p7zip nfs-common nfs-kernel-server atop redshift whois dnsmasq shutter geeqie python python-pip bluefish gtypist klavaro skypeforlinux bluefish gimp gnome-commander redshift-gtk emma tora parcellite adminer phpmyadmin krusader filezilla codeblocks codelite kdevelop x11vnc rofi vim vim-gtk numix-gtk-theme build-essential autoconf automake pkg-config libgtk-3.0 libgtk-3-dev shimmer-themes ppa-purge composer nodejs npm dia ntp
wireshark compton xbindkeys meld ssmtp gphoto2 ncftp pastebinit baobab fonts-inconsolata fonts-hack-ttf smartmontools stress glmark2 testdisk audacious audacity krita mypaint inkscape libreoffice mono-complete keepassx qnapi subdownloader subliminal gcolor2 mc xpad terminator xfburn geany simple-scan chromium-browser nautilus-dropbox firefox hexchat pidgin remmina thunderbird transmission smplayer vlc evince conky vagrant virtualbox aptitude xfonts-terminus i3 j4-dmenu-desktop tmux giggle feh
arandr unclutter glances rxvt-unicode nitrogen sonata mpd ncmpcpp volti xournal blueman xdotool xbacklight'

# Use this package manager command
PACKAGE_MANAGER_COMMAND='apt-get install'

# These packages I have to install manually
# netbeans android-studio soapui node(?) anydesk eclipse

# Execute command
sudo $PACKAGE_MANAGER_COMMAND $PACKAGES

