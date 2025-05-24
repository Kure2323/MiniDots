#!/bin/bash

position = $(pwd)

sudo pacman -Syu --noconfirm
sudo pacman -S wireplumber hyprpaper base-devel git thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools adw-gtk-theme qt5ct qt6ct breeze-icons bat exa thunar --noconfirm

cp -r config/* ~/.config/
cp -r .nanorc ~/.nanorc

hyprpaper -c ~/hypr/hyprpaper.conf

cd ~

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

rm -rf yay 
sudo pacman -R wofi vim --noconfirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-s
yntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosugge
stions

git clone https://github.com/heapbytes/heapbytes-zsh.git
mv heapbytes-zsh/heapbytes.zsh-theme ~/.oh-my-zsh/themes/heapbytes.zsh-theme
rm -rf heapbytes-zsh

cp $position/.zshrc ~/.zshrc
clear
echo 'To set a wallpaper just type "set_wallpaper wallpaper.png"'
echo 'It is recommended to reboot now.'

