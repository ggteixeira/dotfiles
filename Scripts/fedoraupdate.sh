#!/bin/zsh

echo -e "Updating Fedora (DNF)"
sudo dnf update -y

echo -e "\nCleaning Fedora (DNF)"
sudo dnf autoremove -y

echo -e "\nUpdating Snap"
sudo snap refresh

echo -e "\nUpdating Flatpak"
sudo flatpak update

echo -e "\nUpdating Oh-My-ZSH"
$ZSH/tools/upgrade.sh

echo -e "\nUpdating Neovim"
nvim --headless "+Lazy! sync" +qa
