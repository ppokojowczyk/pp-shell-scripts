#!/bin/bash
PACKAGE_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
PACKAGE_FILENAME="vscode.deb"
echo -e "\e[32mInstalling Visual Studio Code from $PACKAGE_URL.\e[0m"
wget -q -O "$PACKAGE_FILENAME" "$PACKAGE_URL"
sudo dpkg --install "$PACKAGE_FILENAME"
rm -f "$PACKAGE_FILENAME"
