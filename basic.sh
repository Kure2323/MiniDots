#!/bin/bash

sudo pacman -Syu
sudo pacman -S hyprpaper zsh base-devel git thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools bat exa --noconfirm
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
source ~/.zshrc

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/ohmyzsh/ohmyzsh/tree/master/themes/heapbytes.zsh-theme $ZSH_CUSTOM/themes/heapbytes
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay
sudo pacman -R wofi


