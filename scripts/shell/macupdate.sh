#!/bin/zsh

echo -e "Brew update"
brew update

echo -e "Brew upgrade"
brew upgrade

echo -e "Brew cleanup"
brew cleanup

echo -e "Brew doctor"
brew doctor

echo -e "OMZ update"
$ZSH/tools/upgrade.sh
