#!/bin/zsh

echo -e "Update Debian packages" 
sudo apt update -y 

echo -e "\nUpgrade Debian packages" 
sudo apt upgrade -y 

echo -e "\nClean Debian packages" 
sudo apt autoremove -y 
sudo apt autoclean -y 
sudo apt clean -y 

echo -e "\nUpdate Snap" 
sudo snap refresh 

echo -e "\nUpdate Flatpak" 
flatpak update -y'

echo "oibebe 5"
