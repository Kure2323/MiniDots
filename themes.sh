echo "Applying themes..."

cp -r themes ~/.oh-my-zsh/

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

git clone https://github.com/Keyitdev/sddm-astronaut-theme.git
sh sddm-astronaut-theme/setup.sh

git clone https://github.com/Lxtharia/minegrub-theme.git
cd minegrub-theme/
sudo ./install_theme.sh
cd ..
sudo rm -r minegrub-theme

cp .zshrc ~/.zshrc

echo "Themes applied successfully."
echo "To set a wallpaper, run the following command: 'set_wallpaper <path_to_wallpaper>'"
echo "It will copy the wallpaper to the correct directory and set it as the wallpaper"
