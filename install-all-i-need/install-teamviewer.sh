#!/bin/bash
PACKAGE_URL="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
PACKAGE_FILENAME="teamviewer_amd64.deb"
echo -e "\e[32mInstalling TeamViewer from $PACKAGE_URL.\e[0m"
wget -q -O "$PACKAGE_FILENAME" "$PACKAGE_URL"
sudo dpkg --install "$PACKAGE_FILENAME"
rm -f "$PACKAGE_FILENAME"
