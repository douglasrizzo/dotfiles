# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it:

    cd ~/.config
    git init
    git remote add origin git@github.com:douglasrizzo/dotfiles.git
    git pull origin master

If any of the files in this repo exist locally, git will print a list that can be used to easily delete them.

Dependencies that can be installed using package managers are the following:

    # blueman network-manager-applet
    curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

    sudo pacman -S python blueman network-manager-applet rofi i3-wm i3status i3-scrot i3lock i3-gaps ttf-font-awesome otf-font-awesome compton feh zsh polybar libmpdclient sublime-text
    sudo yaourt -S megasync telegram-desktop spotify
    sudo -H python get-pip.py
    sudo pip3 install py3status