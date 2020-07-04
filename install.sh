# install packages
sudo pacman -S --needed - < pacman_list.txt
yay -S - < aur_list.txt

# install vscode extensions (currently not working)
code --install-extension ban.spellright
code --install-extension foxundermoon.shell-format
code --install-extension James-Yu.latex-workshop
code --install-extension lextudio.restructuredtext
code --install-extension mosbasik.sxhkdrc-syntax
code --install-extension ms-python.python

# user-level files
ln -vsf `pwd`/zshrc ~/.zshrc
ln -vsf `pwd`/Xresources ~/.myXresources
ln -vsf `pwd`/profile ~/.profile
ln -vsf `pwd`/xprofile ~/.xprofile
ln -vsf `pwd`/profile ~/.zprofile
ln -vsf `pwd`/bibtoolrsc ~/.bibtoolrsc
ln -vsf `pwd`/xcolors ~/.xcolors
ln -vsf `pwd`/screenlayout ~/.screenlayout

# .config files
ln -vsf `pwd`/dodo.zsh-theme $HOME/.oh-my-zsh/themes/
ln -vsf `pwd`/picom.conf ~/.config/picom.conf
ln -vsf `pwd`/latexindent/config.yaml  ~/.config/latexindent.yaml
ln -vsf `pwd`/latexindent/config_location.yaml ~/.indentconfig.yaml
ln -vsf `pwd`/alacritty.yml ~/.config/alacritty.yml
sudo ln -vsf `pwd`/10-libinput.conf /etc/X11/xorg.conf.d/10-libinput.conf

# custom scripts to be used as terminal apps
ln -vsf `pwd`/scripts/micro-kitty ~/.local/bin/mk

# create vscode user config directory
mkdir -p ~/.config/Code/User
ln -vsf `pwd`/vscode-user-settings.json ~/.config/Code/User/settings.json
ln -vsf `pwd`/vscode-keybindings.json ~/.config/Code/User/keybindings.json

# create SpellRight dictionaries directory and download some utf-8 dicts
mkdir -p ~/.config/Code/Dictionaries
wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/en-US/index.aff -O ~/.config/Code/Dictionaries/en_US.aff
wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/en-US/index.dic -O ~/.config/Code/Dictionaries/en_US.dic
wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/pt-BR/index.aff -O ~/.config/Code/Dictionaries/pt_BR.aff
wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/pt-BR/index.dic -O ~/.config/Code/Dictionaries/pt_BR.dic

# .config directories
rm -rf ~/.config/dunst && ln -vsf `pwd`/dunst/ ~/.config
rm -rf ~/.config/htop && ln -vsf `pwd`/htop/ ~/.config
rm -rf ~/.config/i3 && ln -vsf `pwd`/i3/ ~/.config
rm -rf ~/.config/polybar && ln -vsf `pwd`/polybar/ ~/.config
rm -rf ~/.config/rofi && ln -vsf `pwd`/rofi/ ~/.config
rm -rf ~/.config/terminator && ln -vsf `pwd`/terminator/ ~/.config
rm -rf ~/.config/kitty && ln -vsf `pwd`/kitty/ ~/.config
rm -rf ~/.config/bspwm && ln -vsf `pwd`/bspwm/ ~/.config
rm -rf ~/.config/sxhkd && ln -vsf `pwd`/sxhkd/ ~/.config
rm -rf ~/.config/scripts && ln -vsf `pwd`/scripts/ ~/.config
rm -rf ~/.config/yapf && ln -vsf `pwd`/yapf/ ~/.config

# download and install rofi themes
git clone https://github.com/davatorium/rofi-themes.git && mv rofi-themes/User\ Themes/*.rasi ~/.config/rofi/ && rm -rf rofi-themes
