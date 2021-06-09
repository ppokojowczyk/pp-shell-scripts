#!/bin/bash
echo -e "\e[32mInstalling AnyDesk.\e[0m"
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
sudo sh -c 'echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list'
sudo apt update
sudo apt install anydesk
