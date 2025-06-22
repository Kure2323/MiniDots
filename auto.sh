#!/bin/bash

cd ~

sudo cp .scripts/* Minidots/scripts -r
sudo cp .config/hypr Minidots/config -r
sudo cp .config/dunst Minidots/config -r
sudo cp .config/kitty Minidots/config -r
sudo cp .config/gtk-3.0 Minidots/config -r
sudo cp .config/gtk-4.0 Minidots/config -r
sudo cp .config/qt5ct Minidots/config -r
sudo cp .config/qt6ct Minidots/config -r
sudo cp .config/rofi Minidots/config -r
sudo cp .config/Thunar Minidots/config -r
sudo cp .config/waybar Minidots/config -r
sudo cp .oh-my-zsh/themes/heapbytes.zsh-theme Minidots/config/themes -r
cp .zshrc Minidots/zshrc -r
cp .nanorc Minidots/nanorc -r
