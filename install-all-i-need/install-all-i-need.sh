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

TEXT_PROCESSING=(
  #atom
  vim
  vim-gtk
  meld
  geany
  geany-plugin-markdown
  emacs
  neovim
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
    nestopia
    mednaffe
    pcsxr
    scid
    stockfish
    #dwarf-fortress
)

CLI_TOOLS=(
    inotify-tools
    cdw
    wodim
)

UTILS=(
    xserver-xorg-input-synaptics
)

FONTS=(
    unifont
)

MUSIC=(
    fasttracker2
    milkytracker
    goattracker
    hivelytracker
    bambootracker
    schism
    zytrax
    tutka
)

PROGRAMMING=(
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
)

VERSION_CONTROL=(
    git
    giggle
    gitk
    gitg
    git-cola
)

COMMUNICATION=(
    # communication
    skypeforlinux
    hexchat
    pidgin
    remmina
)

FS_NAVIGATION=(
    # file system navigation
    # spacefm
    #gnome-commander
    #krusader
    mc
    doublecmd-gtk
)

SYSTEM_RELATED=(
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
)

NETWORKING=(
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
)

AUDIO=(
    clementine
    audacity
    audacious
    #volti
    #cmus
    #moc
)

VIDEO=(
    smplayer
    vlc
)

PROGRAMMING_LIBS=(
    #libgtk-3.0
    #libgtk-3-dev
    python3
    #python-pip
    #mono-complete
)

TOUCH_TYPING=(
    #gtypist
    #klavaro
)

GRAPHICS=(
    gimp
    geeqie
    gphoto2
    krita
    mypaint
    inkscape
    gcolor3
    gpick
    simple-scan
    feh
    # firealpaca
)

ARCHIVING=(
    unace
    unrar
    p7zip
)

UTILS=(
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
    lynis
)

VIRTUALIZATION=(
    #vagrant
    virtualbox
    virtualbox-dkms
    virtualbox-ext-pack
)

SCREEN_CAPTURE=(
    shutter
    flameshot
    kazam
    peek
)

PRODUCTIVITY=(
    redshift-gtk
    #rofi
    dia
    #xbindkeys
    pastebinit
    xpad
    xournal
)

CLIPBOARD=(
    parcellite
    #diodon
    #clipit
)

DOCKER=(
    docker.io
    docker-compose-v2
)

EMAIL=(
    swaks
)

MATH=(
    # math
    octave
    #sagemath
)

# Update repositories.
sudo $PACKAGE_MANAGER_UPDATE

# Install packages.
sudo $PACKAGE_MANAGER_COMMAND \
    "${PACKAGES[@]}" \
    "${TEXT_PROCESSING[@]}" \
    "${APPEARANCE[@]}" \
    "${FUN[@]}" \
    "${CLI_TOOLS[@]}" \
    "${UTILS[@]}" \
    "${FONTS[@]}" \
    "${MUSIC[@]}"
    "${PROGRAMMING[@]}" \
    "${VERSION_CONTROL[@]}" \
    "${COMMUNICATION[@]}" \
    "${FS_NAVIGATION[@]}" \
    "${SYSTEM_RELATED[@]}" \
    "${NETWORKING[@]}" \
    "${AUDIO[@]}" \
    "${VIDEO[@]}" \
    "${PROGRAMMING_LIBS[@]}" \
    "${TOUCH_TYPING[@]}" \
    "${GRAPHICS[@]}" \
    "${ARCHIVING[@]}" \
    "${UTILS[@]}" \
    "${VIRTUALIZATION[@]}" \
    "${SCREEN_CAPTURE[@]}" \
    "${PRODUCTIVITY[@]}" \
    "${CLIPBOARD[@]}" \
    "${DOCKER[@]}" \
    "${EMAIL[@]}" \
    "${MATH[@]}"

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

