import os

def apply_themes():
    print('Applying themes...')

    print('Copying themes to Oh My Zsh...')
    os.system('cp -r themes ~/.oh-my-zsh/')
    print('Downloading zsh-autosuggestions...')
    os.system('git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions')
    print('Downloading zsh-syntax-highlighting...')
    os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting')
    print('Copying .zshrc to home directory...')
    os.system('cp .zshrc ~/.zshrc')
    os.system('hyprpaper -c ~/.config/hypr/hyprland.conf &')



if __name__ == '__main__':
    apply_themes()
    os.system('clear')
    print('Themes applied successfully.')
    print('To set a wallpaper, run the following command: "set_wallpaper <path_to_wallpaper>"')
    print('It will copy the wallpaper to the correct directory and set it as the wallpaper.')
