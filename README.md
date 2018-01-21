# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it:

    cd ~/.config
    git init
    git remote add origin git@github.com:douglasrizzo/dotfiles.git
    git pull origin master

If any of the files in this repo exist locally, git will print a list that can be used to easily delete them.

Dependencies that can be installed using package managers are the following:

    # blueman network-manager-applet
    sudo pacman -S python blueman network-manager-applet rofi i3-wm i3status i3-scrot i3lock i3-gaps ttf-font-awesome otf-font-awesome compton feh zsh
    sudo yaourt -S megasync atom telegram-desktop spotify
    sudo -H python get-pip.py
    sudo pip3 install py3status