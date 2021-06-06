#!/bin/bash
#
# Script installs all software I need.
#

# Packages to be installed.
PACKAGES=(
    # appearance
    #numix-gtk-theme
    #shimmer-themes
    #compton
    fonts-inconsolata
    fonts-hack-ttf
    xfonts-terminus

    # text processing
    vim
    vim-gtk
    meld
    geany
    #atom
    #sublime-text

    # databases
    #emma
    #adminer
    #phpmyadmin

    # TORA database manager
    #tora
    # to make tora database providers work
    #libqt4-sql-mysql
    #libqt4-sql-psql
    #libqt4-sql-sqlite
    #libqt4-sql-odbc
    #libqt4-sql-tds

    # communication
    skypeforlinux
    hexchat
    pidgin
    remmina

    # file system navigation
    # spacefm
    #gnome-commander
    #krusader
    mc
    doublecmd-gtk

    # system related
    nfs-common
    nfs-kernel-server
    terminator
    #conky
    #aptitude
    #i3
    #j4-dmenu-desktop
    tmux
    glances
    rxvt-unicode
    blueman
    zsh
    extlinux

    # version control
    git
    giggle
    gitk

    # networking
    vsftpd
    whois
    dnsmasq
    filezilla
    ntp
    wireshark
    ssmtp
    ncftp
    chromium-browser
    firefox
    #thunderbird
    transmission

    # audio
    clementine
    audacity
    #volti
    #cmus
    #moc

    # video
    smplayer
    vlc

    # programming libs
    #libgtk-3.0
    #libgtk-3-dev
    python
    #python-pip
    #mono-complete

    # programming
    #bluefish
    #codeblocks
    #codelite
    #kdevelop
    build-essential
    autoconf
    automake
    pkg-config
    #composer
    #nodejs
    #npm

    # touch-typing
    #gtypist
    #klavaro

    # graphics
    gimp
    geeqie
    gphoto2
    krita
    #mypaint
    inkscape
    #gcolor2
    gpick
    simple-scan
    feh

    # archiving
    unace
    unrar
    p7zip

    # utils
    #unclutter
    #atop
    redshift
    #x11vnc
    #ppa-purge
    #baobab
    #smartmontools
    #gsmartcontrol
    #stress
    #glmark2
    testdisk
    libreoffice
    keepassx
    qnapi
    #subdownloader
    #subliminal
    xfburn
    nautilus-dropbox
    evince
    arandr
    #nitrogen
    #xdotool
    #xbacklight
    gparted

    # virtualization
    vagrant
    virtualbox

    # Screenshots
    #shutter # Doesn't exist in repo anymore.
    flameshot

    # productivity
    redshift-gtk
    #rofi
    dia
    #xbindkeys
    #pastebinit
    #xpad
    #xournal

    # clipboard manager
    parcellite
    #diodon
    #clipit

    # fun-stuff
    dosbox
    scummvm
    # zsnes

    # docker
    docker.io

    # email
    swaks
)

# Use this package manager command.
PACKAGE_MANAGER_COMMAND='apt-get install'

# Install packages.
sudo $PACKAGE_MANAGER_COMMAND "${PACKAGES[@]}"

# enpass.
./install-enpass.sh

# Slack.
./install-slack.sh

# Visual Studio Code.
./install-visual-studio-code.sh

# TeamViewer.
./install-teamviewer.sh

# DBeaver.
./install-dbeaver.sh

# Postman.
./install-postman.sh

# AnyDesk.
./install-anydesk.sh

# SoapUI.
./install-soapui.sh

# NetBeans.
./install-netbeans.sh

# Android Studio.
./install-android-studio.sh
