# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it, clone the repo and run `install.sh`. It will create symbolic links to the files at the appropriate places.

If any of the files in this repo exist locally, they will be replaced by the links. Directories, however, are not replaced as of now.

Dependencies that can be installed using package managers are the following:

    sudo pacman -S yay python blueman network-manager-applet rofi i3-wm \
i3status i3lock i3-gaps i3exit ttf-font-awesome otf-font-awesome compton \
feh zsh polybar libmpdclient sublime-text zotero xorg-xbacklight
    sudo yay -S megasync telegram-desktop spotify visual-studio-code-bin

    curl https://bootstrap.pypa.io/get-pip.py | python
    sudo -H python get-pip.py
    sudo pip install py3status
