#!/bin/bash

# Requeriments
echo "Installing requirements..."

sudo pacman -S $(cat requisites.txt) --noconfirm

clear

echo "Requirements installed successfully."

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

# Copy config files
echo "Copying dotfiles..."

cp -r config/* ~/.config/
cp nanorc ~/.nanorc
cp -r scripts ~/.scripts

clear

echo "Dotfiles copied successfully"

# Install oh-my-zsh

read -p "Would you like to download zsh and oh-my-zsh? [y/N]: " res

if [ "$res" == "y" ]; then
	export RUNZSH=no

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
echo "Deleting files and programs we are not going to be using..."

sudo rm -r yay sddm-astronaut-theme minegrub-theme
sudo pacman -R dolphin wofi vim --noconfirm

clear

echo "Installation completed successfully"
echo "To set a wallpaper type: set_wallpaper path/to/wallpaper.png"
echo "Please reboot your system to apply changes."
