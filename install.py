import os
import subprocess


def install_requirements():

    print("Installing requirements...")
    os.system('sudo pacman -S swaync zsh wireplumber hyprpaper base-devel git '
              'thefuck rofi waybar ttf-jetbrains-mono-nerd net-tools '
              'adw-gtk-theme qt5ct qt6ct breeze-icons bat exa thunar --noconfirm')
    os.system('git clone https://aur.archlinux.org/yay.git')
    os.chdir('yay')
    os.system('makepkg -si --noconfirm')
    os.chdir('..')
    os.rmdir('yay')
    os.system('sudo pacman -R wofi vim --noconfirm')
    print("Requirements installed successfully.")

def copy_config_files():
    print("Copying configuration files...")

    os.system('cp -r config/* ~/.config/')
    os.system('cp .nanorc ~/.nanorc')

    print("Configuration files copied successfully.")

def install_oh_my_zsh():
    print("Installing Oh My Zsh...")
    os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
    print("Oh My Zsh installed successfully.")

def apply_themes():
    print('Applying themes...')
    if os.getenv('SHELL') == '/bin/zsh' and os.path.exists('~/.oh-my-zsh'):
        subprocess.run(['python3', 'themes.py'])
        print('Zsh themes applied successfully.')
    else:
        print('Zsh is not installed or Oh My Zsh is not found. Skipping Zsh theme application.')
        print('Please install Zsh and Oh My Zsh manually.')
        print('Then execute theme.py to apply themes.')

    os.system('hyprpaper -c ~/.config/hypr/hyprpaper.conf')


if __name__ == '__main__':
    print('Installing requirements for Hyprland...')
    install_requirements()
    copy_config_files()
    install_oh_my_zsh()
    apply_themes()
    print('Installation completed successfully.')
    print('Please reboot your system to apply changes.')


