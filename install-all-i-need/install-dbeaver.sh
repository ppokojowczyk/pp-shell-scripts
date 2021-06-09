#!/bin/bash
PACKAGE_URL="https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb"
PACKAGE_FILENAME="dbeaver-ce_latest_amd64.deb"
echo -e "\e[32mInstalling DBeaver from $PACKAGE_URL.\e[0m"
wget -q -O "$PACKAGE_FILENAME" "$PACKAGE_URL"
sudo dpkg --install "$PACKAGE_FILENAME"
rm -f "$PACKAGE_FILENAME"
