#!/bin/bash

cd ~

sudo cp .scripts/* MiniDots/scripts -r
sudo cp .config/hypr MiniDots/config -r
sudo cp .config/dunst MiniDots/config -r
sudo cp .config/kitty MiniDots/config -r
sudo cp .config/gtk-3.0 MiniDots/config -r
sudo cp .config/gtk-4.0 MiniDots/config -r
sudo cp .config/qt5ct MiniDots/config -r
sudo cp .config/qt6ct MiniDots/config -r
sudo cp .config/rofi MiniDots/config -r
sudo cp .config/Thunar MiniDots/config -r
sudo cp .config/waybar MiniDots/config -r
sudo cp .oh-my-zsh/themes/heapbytes.zsh-theme MiniDots/config/themes -r
cp .zshrc MiniDots/zshrc -r
cp .nanorc MiniDots/nanorc -r
