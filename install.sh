#!/bin/bash

# Install yay
read -p "Would you want to download yay for AUR packages? [y/N]: " aur

if [ "$aur" == "y" ]; then
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..

        clear

        echo "Yay already installed."
fi

# Requeriments
echo "Installing requirements..."

sudo pacman -Syu --noconfirm
yay -S $(cat requisites.txt) --noconfirm --needed

clear

sudo systemctl enable sddm.service
sudo rm /usr/share/wayland-sessions/hyprland-uwsm.desktop

echo "Requirements installed successfully."

read -p "Is your GPU an Nvidia card? [y/N]: " nvidia

if [ "$nvidia" == "y" ]; then
	sudo pacman -S nvidia --noconfirm
fi
clear

# Copy config files
echo "Copying dotfiles..."

mkdir ~/.config
cp -r config/* ~/.config/
cp nanorc ~/.nanorc
cp -r scripts ~/.scripts

clear

echo "Dotfiles copied successfully"

# Install oh-my-zsh

read -p "Would you like to download zsh and oh-my-zsh? [y/N]: " res

if [ "$res" == "y" ]; then
	export RUNZSH=no

	sudo pacman -S zsh bat --noconfirm
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "Oh My Zsh installed successfully."

	cp -r themes ~/.oh-my-zsh/

	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

	cp zshrc ~/.zshrc
fi
clear

# SDDM ASTRONAUT THEME
read -p "Would you like to set a sddm theme from sddm-astronaut-theme? [y/N]: " sddm

if [ "$sddm" == "y" ]; then

        git clone https://github.com/Keyitdev/sddm-astronaut-theme.git
        sh sddm-astronaut-theme/setup.sh
fi
clear

read -p "Would you like to install and set Minegrub? [y/N]: " grub

if [ "$grub" == "y" ]; then
        git clone https://github.com/Lxtharia/minegrub-theme.git
        cd minegrub-theme/
        sudo ./install_theme.sh
        cd ..
        sudo cp grub /etc/default/
        sudo grub-mkconfig -o /boot/grub/grub.cfg
fi
clear

# Delete stuff
read -p "Would you like to delete the yay, sddm-astronau-theme and minegrub-theme folders? [y/N]: " del

if ["$del" == "y" ]; then
	sudo rm -r sddm-astronaut-theme yay minegrub-theme
fi
clear

echo "Installation completed successfully"
sleep 3
clear

echo "The system will reboot in 3..."
sleep 1
clear

echo "The system will reboot in 2..."
sleep 1
clear

echo "The system will reboot in 1..."
sleep 1
reboot
