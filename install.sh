#!/bin/bash

position=$(pwd)

sudo pacman -Syu --noconfirm
sudo pacman -S zsh wireplumber hyprpaper base-devel git thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools adw-gtk-theme qt5ct qt6ct breeze-icons bat exa thunar --noconfirm

cd ~

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

rm -rf yay
sudo pacman -R wofi vim --noconfirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/heapbytes/heapbytes-zsh.git
mv heapbytes-zsh/heapbytes.zsh-theme ~/.oh-my-zsh/themes/heapbytes.zsh-theme
rm -rf heapbytes-zsh

cp -r $position/config/* ~/.config/
cp -r $position/.nanorc ~/.nanorc
cp -r $position/.zshrc ~/.zshrc
cp -r $position/.oh-my-zsh ~/.oh-my-zsh
clear
echo 'To set a wallpaper just type "set_wallpaper wallpaper.png"'
echo 'It is recommended to reboot now.'

hyprpaper -c ~/hypr/hyprpaper.conf
