bold=$(tput bold)
normal=$(tput sgr0)

install_stuff() {
  echo "${bold}Installing stuff from pacman...${normal}"
  sudo pacman -S --needed - <pacman_list.txt
  echo "${bold}Installing stuff with yay...${normal}"
  yay -S - <aur_list.txt
}

config_terminal() {
  echo "${bold}Configuring ZSH...${normal}"
  sudo pacman -S --needed zsh

  echo "${bold}Downloading oh my zsh...${normal}"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "${bold}Downloading powerlevel10k and its fonts...${normal}"
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts
  wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  echo "${bold}Downloading zsh plugins...${normal}"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

link_stuff() {
  echo "${bold}Linking user level files...${normal}"
  for d in bibtoolrsc profile xcolors xprofile Xresources zshenv; do
    ln -vsf $(pwd)/${d} ~/.${d}
  done

  echo "${bold}Linking ~/.config files...${normal}"
  ln -vsf $(pwd)/dodo.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -vsf $(pwd)/nanorc $HOME/.config/nano/nanorc
  ln -vsf $(pwd)/picom.conf ~/.config/picom.conf
  ln -vsf $(pwd)/latexindent/config.yaml ~/.config/latexindent.yaml
  ln -vsf $(pwd)/latexindent/config_location.yaml ~/.indentconfig.yaml
  ln -vsf $(pwd)/alacritty.yml ~/.config/alacritty.yml
  ln -vsf $(pwd)/xorg.conf.d/* /etc/X11/xorg.conf.d/

  ln -vsf $(pwd)/pywalfox_update.sh ~/.config/pywalfox_update.sh

  echo "${bold}Linking ~/.config directories...${normal}"
  for d in bspwm dunst htop i3 kitty mpv polybar rofi scripts sxhkd terminator vlc yapf zsh; do
    rm -rf ~/.config/${d} && ln -vsf $(pwd)/${d} ~/.config
  done
}

download_stuff() {
  echo "${bold}Downloading rofi themes...${normal}"
  git clone https://github.com/davatorium/rofi-themes.git && mv rofi-themes/User\ Themes/*.rasi ~/.config/rofi/ && rm -rf rofi-themes

  echo "${bold}Downloading TeX Live netinstall to ~/Downloads...${normal}"
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -P ~/Downloads

  echo "${bold}Downloading Zotero addons to ~/Downloads...${normal}"
  wget https://github.com/bwiernik/zotero-shortdoi/releases/download/v1.3.9/zotero-shortdoi-1.3.9.xpi -P ~/Downloads
  wget https://github.com/retorquere/zotero-better-bibtex/releases/download/v5.2.70/zotero-better-bibtex-5.2.70.xpi -P Downloads
  wget https://github.com/jlegewie/zotfile/releases/download/v5.0.16/zotfile-5.0.16-fx.xpi -P Downloads
  wget https://github.com/willsALMANJ/Zutilo/releases/download/v3.5.0/zutilo.xpi -P Downloads
  wget https://github.com/retorquere/zotero-storage-scanner/releases/download/v5.0.8/zotero-storage-scanner-5.0.8.xpi -P Downloads
}

install_python() {
  echo "${bold}Downloading Miniconda to ~/Downloads...${normal}"
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Downloads/miniconda.sh
  chmod +x ~/Downloads/miniconda.sh
  ~/Downloads/miniconda.sh -b -p $HOME/.anaconda3
  rm ~/Downloads/miniconda.sh
}

code_install_stuff() {
  for ext in \
    aaron-bond.better-comments \
    alanwalk.markdown-toc \
    ankitcode.firefly \
    Codeium.codeium \
    coenraads.bracket-pair-colorizer-2 \
    davidanson.vscode-markdownlint \
    efoerster.texlab \
    foxundermoon.shell-format \
    lextudio.restructuredtext \
    mhutchie.git-graph \
    ms-python.black-formatter \
    ms-python.flake8 \
    ms-python.isort \
    ms-python.python \
    ms-python.vscode-pylance \
    njpwerner.autodocstring \
    sandcastle.vscode-open \
    teabyii.ayu \
    tyriar.sort-lines \
    valentjn.vscode-ltex \
    VisualStudioExptTeam.vscodeintellicode \
    vomout.latex-syntax \
    xaver.clang-format; do
    code --install-extension $ext
  done
}

install_gpu_lightdm() {
  sudo mhwd -a pci nonfree 0300
  sudo pacman -S lightdm lightdm-slick-greeter lightdm-settings
  sudo systemctl enable lightdm.service --force
}

link_stuff
config_terminal
download_stuff
install_stuff
install_python
code_install_stuff
