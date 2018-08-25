#!/bin/bash

#
# Script installs all software I need
#

# Packages to be installed
PACKAGES=(

    # appearance
    numix-gtk-theme shimmer-themes compton fonts-inconsolata fonts-hack-ttf xfonts-terminus variety

    # text processing
    vim vim-gtk meld geany

    # databases
    emma tora adminer phpmyadmin

    # communication
    skypeforlinux hexchat pidgin remmina

    # file system navigation
    gnome-commander krusader mc spacefm doublecmd-gtk

    # system related
    nfs-common nfs-kernel-server terminator conky aptitude i3 j4-dmenu-desktop tmux glances rxvt-unicode blueman

    # version control
    git giggle

    # networking
    vsftpd whois dnsmasq filezilla ntp wireshark ssmtp ncftp chromium-browser firefox thunderbird transmission

    # audio
    sonata mpd ncmpcpp audacious audacity sonata mpd ncmpcpp volti

    # video
    smplayer vlc

    # programming libs
    libgtk-3.0 libgtk-3-dev python python-pip mono-complete

    # programming
    bluefish bluefish codeblocks codelite kdevelop build-essential autoconf automake pkg-config composer nodejs npm

    # touch-typing
    gtypist klavaro

    # graphics
    gimp geeqie gphoto2 krita mypaint inkscape gcolor2 simple-scan feh

    # archiving
    unace unrar p7zip

    # utils
    unclutter atop redshift x11vnc ppa-purge baobab smartmontools stress glmark2 testdisk libreoffice keepassx qnapi subdownloader subliminal xfburn nautilus-dropbox evince
    arandr nitrogen xdotool xbacklight

    # virtualization
    vagrant virtualbox

    # productivity
    shutter redshift-gtk rofi dia xbindkeys pastebinit xpad unclutter xournal

    # clipboard manager
    parcellite
    #diodon
    #clipit
    
)

# Use this package manager command
PACKAGE_MANAGER_COMMAND='apt-get install'

# These packages I have to install manually
# netbeans android-studio soapui node(?) anydesk eclipse

# Execute command
sudo $PACKAGE_MANAGER_COMMAND "${PACKAGES[@]}"
