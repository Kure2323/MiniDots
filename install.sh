#!/bin/bash

# Requeriments
echo "Installing requirements..."

sudo pacman -S vlc ark file-roller thunar-archive-plugin gnome-calculator gedit tar xfce4-taskmanager nano zsh wireplumber hyprpaper base-devel git thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools adw-gtk-theme qt5ct qt6ct breeze-icons bat exa thunar --noconfirm

clear

echo "Requirements installed successfully."

# Install yay
echo "Installing yay for AUR packages"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

clear

echo "Yay already installed."

# Copy config files
echo "Copying dotfiles..."

cp -r config/* ~/.config/
cp .nanorc ~/.nanorc

clear

echo "Dotfiles copied successfully"

# Install oh-my-zsh
echo "Installing Oh My Zsh..."
echo 'Once the installation in complete, you sould see a message saying "Oh My Zsh installed successfully."'
echo "Otherwise, please do ctrl + d to go back to the installation script"

sleep 5

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Oh My Zsh installed successfully."

# Delete stuff
echo "Deleting files and programs we are not going to be using..."

sudo rm -r yay
sudo pacman -R dolphin wofi vim --noconfirm

clear

echo "All useless stuff deleted."

# Apply themes
echo "Applying themes"

sh themes.sh

echo "All themes applied"
echo "Installation completed successfully"
echo "Please reboot your system to apply changes."
