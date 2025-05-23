#!/bin/bash

sudo pacman -Syu
sudo pacman -S hyprpaper zsh base-devel git thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools adw-gtk-theme qt5ct qt6ct kvantum kvantum breeze-icons bat exa thunar --noconfirm
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
source ~/.zshrc

