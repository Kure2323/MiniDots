# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="heapbytes"


# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  zsh-autosuggestions  
  zsh-syntax-highlighting
  )

source $ZSH/oh-my-zsh.sh

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# exa --icons
# ls
alias ls='exa --icons'
alias l='exa --icons -lh'
alias ll='exa --icons -lah'
alias la='exa --icons -A'
alias lm='exa --icons -m'
alias lr='exa --icons -R'
alias lg='exa --icons -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

#my

#alias nvim='$HOME/.local/bin/lvim'
#alias lvim='$HOME/.local/bin/lvim'
alias pinstall='sudo pacman -S'
alias update='sudo pacman -Syu --noconfirm'
alias i='yay -S'
alias s='yay -s -S'
alias cat='bat'

precmd(){
	precmd(){
		echo 
	}
}



set_wallpaper(){
    # Obtiene la ruta absoluta del archivo
    local wallpaper_path=$(realpath "$1")
    local name=$(basename "$wallpaper_path")



    # Crea el directorio de configuración si no existe
    mkdir -p ~/.config/hypr/wallpaper

    # Vacía la carpeta de wallpapers
    rm -r ~/.config/hypr/wallpaper/*
    # Copia el archivo a la carpeta de wallpapers
    cp "$wallpaper_path" ~/.config/hypr/wallpaper/

    wal -i ~/.config/hypr/wallpaper/$name

    # Escribe la configuración en el archivo
    echo "preload = ~/.config/hypr/wallpaper/$name" > ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = , ~/.config/hypr/wallpaper/$name" >> ~/.config/hypr/hyprpaper.conf

    echo "Wallpaper set to $name"
    # Reload Hyprland to apply the changes
    hyprctl hyprpaper preload "~/.config/hypr/wallpaper/$name"
    hyprctl hyprpaper wallpaper ",~/.config/hypr/wallpaper/$name"
}



