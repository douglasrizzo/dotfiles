# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it, clone the repo and run `install.sh`. It will create symbolic links to the files at the appropriate places.

If any of the files in this repo exist locally, they will be replaced by the links. Directories, however, are not replaced as of now.

Dependencies that can be installed using package managers are the following:

```sh
sudo pacman -S adobe-source-code-pro-fonts /
                blueman /
                bspwm /
                compton /
                feh /
                i3-gaps /
                i3-wm /
                i3lock /
                i3status /
                keepassx2 /
                kitty /
                libmpdclient /
                network-manager-applet /
                otf-font-awesome /
                pamac-tray /
                pamixer /
                pavucontrol /
                polybar /
                pulseaudio /
                pulseaudio-alsa /
                python /
                rofi /
                sxhkd /
                ttf-font-awesome /
                ttf-ibm-plex /
                ttf-roboto /
                xorg-xbacklight /
                xorg-xsetroot /
                xscreensaver /
                yay /
                zsh /
                zsh-autosuggestions /
                zsh-syntax-highlighting

yay -S gitkraken /
       jabref /
       megasync /
       otf-san-francisco /
       spotify /
       telegram-desktop /
       visual-studio-code-bin

curl https://bootstrap.pypa.io/get-pip.py | python
sudo -H python get-pip.py
sudo pip install py3status

code --install-extension --force abelcour.asp-syntax-highlight
code --install-extension --force ban.spellright
code --install-extension --force coolbear.systemd-unit-file
code --install-extension --force DotJoshJohnson.xml
code --install-extension --force foxundermoon.shell-format
code --install-extension --force James-Yu.latex-workshop
code --install-extension --force lextudio.restructuredtext
code --install-extension --force ms-python.python
code --install-extension --force mosbasik.sxhkdrc-syntax
```