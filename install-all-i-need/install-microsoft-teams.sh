#!/bin/bash
PACKAGE_URL="https://go.microsoft.com/fwlink/p/?LinkID=2112886&clcid=0x4409&culture=en-my&country=MY"
PACKAGE_FILENAME="microsoft-teams.deb"
echo -e "\e[32mInstalling Microsoft Teams from $PACKAGE_URL.\e[0m"
wget -q -O "$PACKAGE_FILENAME" "$PACKAGE_URL"
sudo dpkg --install "$PACKAGE_FILENAME"
rm -f "$PACKAGE_FILENAME"
