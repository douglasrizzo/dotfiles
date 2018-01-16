# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it:

    git init
    git remote add origin git@github.com:douglasrizzo/dotfiles.git
    git pull origin master

If any of the files in this repo exists locally, git will print a list that can be used to easily delete them.

Dependencies that can be installed using package managers are the following:

    sudo apt install blueman network-manager-applet rofi i3 i3lock fonts-font-awesome fonts-firacode compton i3status feh zsh
    sudo pip3 install py3status terminator

To install Atom as autonomously as possible:

    wget https://atom.io/download/deb -O atom.deb
    sudo dpkg -i atom.deb
    apm install --package-file .atom/packages-list.txt

Currently, rofi needs to be compiled from source on Ubuntu. These are its dependencies:

    sudo apt install make cmake bison flex libxcb1 libxkbcommon-dev libglib2.0-dev libxkbcommon-x11-dev libxcb1-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-xinerama0-dev libpango1.0-dev libpangocairo-1.0-0 libstartup-notification0-dev librsvg2-dev

It also depends on a version of `check` that is not available on `apt`. Download it [here](https://github.com/libcheck/check/releases/).

Then, download rofi [here](https://github.com/DaveDavenport/rofi/releases), compile and install.

Telegram:

  wget https://telegram.org/dl/desktop/linux -O tsetup.tar.xz
  tar -xvf tsetup.tar.xz
  sudo mv Telegram /opt/telegram

MegaSync: https://mega.nz/sync
Spotify: https://www.spotify.com/download/linux/
