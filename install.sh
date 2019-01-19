# user-level files
ln -vsf `pwd`/.zshrc ~/.zshrc
ln -vsf `pwd`/.Xresources ~/.Xresources
ln -vsf `pwd`/.profile ~/.profile
ln -vsf `pwd`/.xprofile ~/.xprofile
ln -vsf `pwd`/.profile ~/.zprofile
ln -vsf `pwd`/.bibtoolrsc ~/.bibtoolrsc

# .config files
ln -vsf `pwd`/compton.conf ~/.config/compton.conf
ln -vsf `pwd`/latexindent/config.yaml 
~/.config/latexindent.yaml
ln -vsf `pwd`/latexindent/config_location.yaml ~/.indentconfig.yaml
ln -vsf `pwd`/i3-scrot.conf ~/.config/i3-scrot.conf

# create vscode user config directory
mkdir -p ~/.config/Code/User
ln -vsf `pwd`/vscode-user-settings.json ~/.config/Code/User/settings.json
ln -vsf `pwd`/vscode-keybindings.json ~/.config/Code/User/keybindings.json

# .config directories
# these are not erased if they exist
rm -rf ~/.config/dunst && ln -vsf `pwd`/dunst/ ~/.config
rm -rf ~/.config/htop && ln -vsf `pwd`/htop/ ~/.config
rm -rf ~/.config/i3 && ln -vsf `pwd`/i3/ ~/.config
rm -rf ~/.config/polybar && ln -vsf `pwd`/polybar/ ~/.config
rm -rf ~/.config/rofi && ln -vsf `pwd`/rofi/ ~/.config
rm -rf ~/.config/terminator && ln -vsf `pwd`/terminator/ ~/.config
rm -rf ~/.config/kitty && ln -vsf `pwd`/kitty/ ~/.config
