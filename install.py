import os
import subprocess
from time import sleep


def clear():
    os.system('clear')

def install_requirements():

    print("Installing requirements...")
    os.system('sudo pacman -S vlc zip unzip tar xfce4-taskmanager swaync nano zsh wireplumber hyprpaper base-devel git '
              'thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools '
              'adw-gtk-theme qt5ct qt6ct breeze-icons bat exa thunar --noconfirm')
    clear()
    print("Requirements installed successfully.")

def install_yay():

    print('Installing yay for AUR packages...')
    os.system('git clone https://aur.archlinux.org/yay.git')
    os.chdir('yay')
    os.system('makepkg -si --noconfirm')
    os.chdir('..')
    clear()
    print('Yay already installed.')

def delete_stuff():

    print('Deleting files and programs we are not going to be using...')
    os.system('sudo rm -r yay')
    os.system('sudo pacman -R dolphin wofi vim dunst --noconfirm')
    clear()
    print('All useless stuff deleted.')

def copy_config_files():
    print("Copying configuration files...")

    os.system('cp -r config/* ~/.config/')
    os.system('cp .nanorc ~/.nanorc')
    clear()

    print("Configuration files copied successfully.")

def install_oh_my_zsh():
    print("Installing Oh My Zsh...")
    print('Once the installation in complete, you sould see a message saying "Oh My Zsh installed successfully."')
    print('Otherwise, please do ctrl + c/d to go back to the script')
    sleep(5)
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
    clear()
    print("Oh My Zsh installed successfully.")

def apply_themes():
    print('Applying themes...')
    
    subprocess.run(['python3', 'themes.py'])
    print('Zsh themes applied successfully.')




if __name__ == '__main__':
    print('Installing requirements for Hyprland...')
    install_requirements()
    install_yay()
    copy_config_files()
    install_oh_my_zsh()
    delete_stuff()
    apply_themes()
    clear()
    print('Installation completed successfully.')
    print('Please reboot your system to apply changes.')


