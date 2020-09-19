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
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}s/plugins/zsh-autosuggestions
}

link_stuff() {
  echo "${bold}Linking user level files...${normal}"
  ln -vsf $(pwd)/Xresources ~/.myXresources
  ln -vsf $(pwd)/profile ~/.profile
  ln -vsf $(pwd)/xprofile ~/.xprofile
  ln -vsf $(pwd)/profile ~/.zprofile
  ln -vsf $(pwd)/bibtoolrsc ~/.bibtoolrsc
  ln -vsf $(pwd)/xcolors ~/.xcolors
  ln -vsf $(pwd)/screenlayout ~/.screenlayout
  ln -vsf $(pwd)/nanorc ~/.nanorc

  echo "${bold}Linking ~/.config files...${normal}"
  ln -vsf $(pwd)/dodo.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -vsf $(pwd)/picom.conf ~/.config/picom.conf
  ln -vsf $(pwd)/latexindent/config.yaml ~/.config/latexindent.yaml
  ln -vsf $(pwd)/latexindent/config_location.yaml ~/.indentconfig.yaml
  ln -vsf $(pwd)/alacritty.yml ~/.config/alacritty.yml
  sudo ln -vsf $(pwd)/10-libinput.conf /etc/X11/xorg.conf.d/10-libinput.conf

  echo "${bold}Linking ~/.config VS Code settings and keybindings...${normal}"
  mkdir -p ~/.config/Code/User
  ln -vsf $(pwd)/vscode-user-settings.json ~/.config/Code/User/settings.json
  ln -vsf $(pwd)/vscode-keybindings.json ~/.config/Code/User/keybindings.json

  echo "${bold}Linking ~/.config directories...${normal}"
  rm -rf ~/.config/zsh && ln -vsf $(pwd)/zsh ~/.config
  rm -rf ~/.config/dunst && ln -vsf $(pwd)/dunst/ ~/.config
  rm -rf ~/.config/htop && ln -vsf $(pwd)/htop/ ~/.config
  rm -rf ~/.config/i3 && ln -vsf $(pwd)/i3/ ~/.config
  rm -rf ~/.config/polybar && ln -vsf $(pwd)/polybar/ ~/.config
  rm -rf ~/.config/rofi && ln -vsf $(pwd)/rofi/ ~/.config
  rm -rf ~/.config/terminator && ln -vsf $(pwd)/terminator/ ~/.config
  rm -rf ~/.config/kitty && ln -vsf $(pwd)/kitty/ ~/.config
  rm -rf ~/.config/bspwm && ln -vsf $(pwd)/bspwm/ ~/.config
  rm -rf ~/.config/sxhkd && ln -vsf $(pwd)/sxhkd/ ~/.config
  rm -rf ~/.config/scripts && ln -vsf $(pwd)/scripts/ ~/.config
  rm -rf ~/.config/yapf && ln -vsf $(pwd)/yapf/ ~/.config
}

download_stuff() {
  echo "${bold}Downloading rofi themes...${normal}"
  git clone https://github.com/davatorium/rofi-themes.git && mv rofi-themes/User\ Themes/*.rasi ~/.config/rofi/ && rm -rf rofi-themes

  echo "${bold}Creating SpellRight dictionaries directory and download some utf-8 dicts...${normal}"
  mkdir -p ~/.config/Code/Dictionaries
  wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/en-US/index.aff -O ~/.config/Code/Dictionaries/en_US.aff
  wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/en-US/index.dic -O ~/.config/Code/Dictionaries/en_US.dic
  wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/pt-BR/index.aff -O ~/.config/Code/Dictionaries/pt_BR.aff
  wget https://github.com/wooorm/dictionaries/raw/master/dictionaries/pt-BR/index.dic -O ~/.config/Code/Dictionaries/pt_BR.dic

  echo "${bold}Downloading TeX Live netinstall to ~/Downloads...${normal}"
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -P ~/Downloads

  echo "${bold}Downloading Miniconda to ~/Downloads...${normal}"
  echo wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P ~/Downloads
}

pip_install_stuff() {
  pip install -U pip
  pip install -U \
    flake8-mypy \
    git+https://github.com/deepmind/pysc2.git@v3.0#egg=pysc2 \
    git+https://github.com/douglasrizzo/dodo_detector.git \
    git+https://github.com/douglasrizzo/smac.git@personal \
    GPUtil \
    instalooter \
    ipython \
    isort \
    jupyterlab \
    matplotlib \
    mccabe \
    mypy \
    numpy \
    pylama \
    pylint \
    pyls-mypy \
    pywal \
    scipy \
    seaborn \
    stable-baselines \
    streamlink \
    tqdm \
    wandb \
    yapf
}

link_stuff
config_terminal
download_stuff
install_stuff
pip_install_stuff
