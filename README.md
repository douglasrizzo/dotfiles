# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it, clone the repo and run `install.sh`. It will create symbolic links to the files at the appropriate places.

If any of the files in this repo exist locally, they will be replaced by the links. Directories, however, are not replaced as of now.

Dependencies that can be installed using package managers are the following:

    sudo pacman -S adobe-source-code-pro-fonts blueman compton feh \
    i3-gaps i3-wm i3exit i3lock i3status kitty libmpdclient \
    network-manager-applet otf-font-awesome pamac-tray pamixer \
    pavucontrol polybar pulseaudio python rofi ttf-font-awesome \
    ttf-ibm-plex ttf-roboto xorg-xbacklight yay zsh
    
    sudo yay -S megasync spotify telegram-desktop visual-studio-code-bin zotero

    curl https://bootstrap.pypa.io/get-pip.py | python
    sudo -H python get-pip.py
    sudo pip install py3status