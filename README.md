# My dotfiles and initial configuration

This repository contains my configuration files. In order to use it, clone the repo and run `install.sh`. It will create symbolic links to the files at the appropriate places.

If any of the files in this repo exist locally, they will be replaced by the links. Directories, however, are not replaced as of now.

Dependencies that can be installed using package managers are the following:

```sh
sudo pacman -S adobe-source-code-pro-fonts /
                blueman /
                bspwm /
                feh /
                keepassxc /
                kitty /
                libmpdclient /
                network-manager-applet /
                otf-font-awesome /
                pamixer /
                pavucontrol /
                polybar /
                pulseaudio /
                pulseaudio-alsa /
                python /
                rofi /
                scrot /
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
       spotify /
       telegram-desktop /
       ttf-roboto-mono /
       visual-studio-code-bin /
       xgetres
       
mkdir -p ~/.local/share/fonts
wget https://github.com/ThomasJockin/lexend/raw/master/fonts/ttf/LexendDeca-Regular.ttf -O ~/.local/share/fonts/LexendDeca-Regular.ttf && fc-cache

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