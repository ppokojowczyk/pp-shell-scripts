#!/bin/bash
#
# Script installs all software I need.
#

# Always end on errors.
set -e

# Use this package manager command.
PACKAGE_MANAGER_COMMAND='apt-get install'
PACKAGE_MANAGER_UPDATE='apt-get update'

# Packages to be installed.
PACKAGES=(
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
    gitg
    git-cola

    # networking
    vsftpd
    whois
    dnsmasq
    filezilla
    ntp
    wireshark
    #kismet
    ssmtp
    ncftp
    #chromium-browser
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
    python3
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
    neofetch
    lolcat

    # virtualization
    #vagrant
    #virtualbox

    # Screenshots
    #shutter # Doesn't exist in repo anymore.
    flameshot

    # productivity
    redshift-gtk
    #rofi
    dia
    #xbindkeys
    pastebinit
    xpad
    xournal

    # clipboard manager
    parcellite
    #diodon
    #clipit

    # docker
    docker.io
    docker-compose-v2

    # email
    swaks
)

TEXT_PROCESSING=(
  #atom
  vim
  vim-gtk
  meld
  geany
  #sublime-text
)

APPEARANCE=(
    adapta-gtk-theme
    arc-theme
    #numix-gtk-theme
    #shimmer-themes
    #compton
    fonts-inconsolata
    fonts-hack-ttf
    xfonts-terminus
)

FUN=(
    dosbox
    scummvm
    # zsnes
)

CLI_TOOLS=(
    inotify-tools
)

UTILS=(
    xserver-xorg-input-synaptics
)

FONTS=(
    unifont
)

# Update repositories.
sudo $PACKAGE_MANAGER_UPDATE

# Install packages.
sudo $PACKAGE_MANAGER_COMMAND "${PACKAGES[@]}" "${TEXT_PROCESSING[@]}" "${APPEARANCE[@]}" "${FUN[@]}" "${CLI_TOOLS[@]}" "${UTILS[@]}" "${FONTS[@]}"

# Ask about installing additional software.
exit 0;

# Google Chrome.
./install-google-chrome.sh

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
