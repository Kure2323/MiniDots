#!/bin/bash
mv hypr ~/.config/hypr
mv waybar ~/.config/waybar

cd ~

mkdir ~/.config/rofi
echo '@theme "/usr/share/rofi/themes/gruvbox-dark-soft.rasi"' > ~/.config/rofi/config.rasi

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
sudo pacman -R wofi
