import os

def apply_themes():
    print('Applying themes...')

    os.system('cp -r .oh-my-zsh ~/.oh-my-zsh')
    os.system('cp .zshrc ~/.zshrc')

if __name__ == '__main__':
    apply_themes()
    print('Themes applied successfully.')