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
  for d in bibtoolrsc nanorc profile screenlayout xcolors xprofile Xresources; do
    ln -vsf $(pwd)/${d} ~/.${d}
  done

  echo "${bold}Linking ~/.config files...${normal}"
  ln -vsf $(pwd)/dodo.zsh-theme $HOME/.oh-my-zsh/themes/
  ln -vsf $(pwd)/picom.conf ~/.config/picom.conf
  ln -vsf $(pwd)/latexindent/config.yaml ~/.config/latexindent.yaml
  ln -vsf $(pwd)/latexindent/config_location.yaml ~/.indentconfig.yaml
  ln -vsf $(pwd)/alacritty.yml ~/.config/alacritty.yml
  sudo ln -vsf $(pwd)/10-libinput.conf /etc/X11/xorg.conf.d/10-libinput.conf

  ln -vsf $(pwd)/pywalfox_update.sh ~/.config/pywalfox_update.sh

  echo "${bold}Linking ~/.config VS Code settings and keybindings...${normal}"
  mkdir -p ~/.config/Code/User
  ln -vsf $(pwd)/vscode-user-settings.json ~/.config/Code/User/settings.json
  ln -vsf $(pwd)/vscode-keybindings.json ~/.config/Code/User/keybindings.json

  echo "${bold}Linking ~/.config directories...${normal}"
  for d in bspwm dunst htop i3 kitty polybar rofi scripts sxhkd terminator vlc yapf zsh; do
    rm -rf ~/.config/${d} && ln -vsf $(pwd)/${d} ~/.config
  done
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
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P ~/Downloads

  echo "${bold}Downloading Zotero addons to ~/Downloads...${normal}"
  wget https://github.com/bwiernik/zotero-shortdoi/releases/download/v1.3.9/zotero-shortdoi-1.3.9.xpi -P ~/Downloads
  wget https://github.com/retorquere/zotero-better-bibtex/releases/download/v5.2.70/zotero-better-bibtex-5.2.70.xpi -P Downloads
  wget https://github.com/jlegewie/zotfile/releases/download/v5.0.16/zotfile-5.0.16-fx.xpi -P Downloads
  wget https://github.com/willsALMANJ/Zutilo/releases/download/v3.5.0/zutilo.xpi -P Downloads
  wget https://github.com/retorquere/zotero-storage-scanner/releases/download/v5.0.8/zotero-storage-scanner-5.0.8.xpi -P Downloads
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
    pywalfox \
    scipy \
    seaborn \
    stable-baselines \
    streamlink \
    tqdm \
    wandb \
    yapf
}

code_install_stuff() {
  for ext in \
    adamvoss.vscode-languagetool \
    alanwalk.markdown-toc \
    ankitcode.firefly \
    coenraads.bracket-pair-colorizer-2 \
    davidanson.vscode-markdownlint \
    dlasagno.wal-theme \
    efoerster.texlab \
    foxundermoon.shell-format \
    lextudio.restructuredtext \
    ms-python.python \
    ms-python.vscode-pylance \
    njpwerner.autodocstring \
    sandcastle.vscode-open \
    shan.code-settings-sync \
    teabyii.ayu \
    tyriar.sort-lines \
    valentjn.vscode-ltex \
    visualstudioexptteam.vscodeintellicode \
    vomout.latex-syntax \
    xaver.clang-format; do
    code --install-extension $ext
  done
}

link_stuff
config_terminal
download_stuff
install_stuff
pip_install_stuff
code_install_stuff
