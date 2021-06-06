#!/bin/bash
PACKAGE_URL="https://dl.pstmn.io/download/latest/linux64"
PACKAGE_FILENAME="postman.deb"
echo -e "\e[32mInstalling Postman from $PACKAGE_URL.\e[0m"
wget -O "$PACKAGE_FILENAME" "$PACKAGE_URL"
sudo dpkg --install "$PACKAGE_FILENAME"
rm -f "$PACKAGE_FILENAME"
