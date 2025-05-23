#!/bin/bash

sudo pacman -Syu
sudo pacman -S wireplumber hyprpaper zsh base-devel git thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools adw-gtk-theme qt5ct qt6ct breeze-icons bat exa thunar --noconfirm
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
echo 'Execute source ~/.zshrc, then close and open the terminal. The you could execute the second script.'

