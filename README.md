# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it, clone the repo and run `install.sh`. It will create symbolic links to the files at the appropriate places.

If any of the files in this repo exist locally, they will be replaced by the links. Directories, however, are not replaced as of now.

Dependencies that can be installed using package managers are the following:

    sudo pacman -S python i3-gaps blueman compton pamixer polybar \
    i3status keepassx2 pamac-tray pulseaudio kitty rofi \
    ttf-roboto pavucontrol ttf-ibm-plex libmpdclient zsh \
    xorg-xbacklight pulseaudio-alsa ttf-font-awesome i3-wm \
    otf-font-awesome zsh-autosuggestions i3lock i3exit yay \
    network-manager-applet adobe-source-code-pro-fonts feh
    
    sudo yay -S megasync gitkraken spotify telegram-desktop \
    visual-studio-code-bin jabref

    curl https://bootstrap.pypa.io/get-pip.py | python
    sudo -H python get-pip.py
    sudo pip install py3status