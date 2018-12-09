# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it, clone the repo and run `install.sh`. It will create symbolic links to the files at the appropriate places.

If any of the files in this repo exist locally, they will be replaced by the links. Directories, however, are not replaced as of now.

Dependencies that can be installed using package managers are the following:

    sudo pacman -S i3-wm i3status i3lock i3-gaps i3exit compton \
    rofi feh zsh polybar xorg-xbacklight network-manager-applet \
    blueman libmpdclient python yay adobe-source-code-pro-fonts \
    ttf-roboto ttf-ibm-plex ttf-font-awesome otf-font-awesome pamixer
    
    sudo yay -S megasync spotify telegram-desktop visual-studio-code-bin zotero

    curl https://bootstrap.pypa.io/get-pip.py | python
    sudo -H python get-pip.py
    sudo pip install py3status