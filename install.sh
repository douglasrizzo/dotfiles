# user-level files
ln -vsf `pwd`/.zshrc ~/.zshrc
ln -vsf `pwd`/.Xresources ~/.Xresources
ln -vsf `pwd`/.profile ~/.profile
ln -vsf `pwd`/.xprofile ~/.xprofile
ln -vsf `pwd`/.profile ~/.zprofile


# .config files
ln -vsf `pwd`/compton.conf ~/.config/compton.conf
ln -vsf `pwd`/latexindent_config.yaml ~/.config/latexindent_config.yaml
ln -vsf `pwd`/i3-scrot.conf ~/.config/i3-scrot.conf

# .config directories
# these are not erased if they exist
ln -vsf `pwd`/dunst/ ~/.config/dunst
ln -vsf `pwd`/htop/ ~/.config/htop
ln -vsf `pwd`/i3/ ~/.config/i3
ln -vsf `pwd`/polybar/ ~/.config/polybar
ln -vsf `pwd`/rofi/ ~/.config/rofi
ln -vsf `pwd`/terminator/ ~/.config/terminator
