#!/bin/bash

cp -r config/* ~/.config/
cp -r .zshrc ~/.zshrc
cp -r .nanorc ~/.nanorc

cd ~

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

hyprpaper -c ~/hypr/hyprpaper.conf

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-s
yntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosugge
stions
git clone https://github.com/heapbytes/heapbytes-zsh.git
mv heapbytes-zsh/heapbytes.zsh-theme ~/.oh-my-zsh/themes/heapbytes.zsh-theme

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~


rm -rf yay heapbytes-zsh
sudo pacman -R wofi vim
clear
echo 'All done, you should reboot by typing reboot'

