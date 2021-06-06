echo -e "\e[32mInstalling enpass.\e[0m"
sudo echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install enpass
