#!/usr/bin/env sh
bold=$(tput bold)
normal=$(tput sgr0)

install_stuff() {
	echo "${bold}Installing stuff from pacman...${normal}"
	sudo cat pacman_list.txt | sudo pacman -S --needed -
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
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k

	echo "${bold}Downloading zsh plugins...${normal}"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
}

link_stuff() {
	echo "${bold}Linking home files with stow...${normal}"
	stow . -t $HOME

	echo "${bold}Linking Xorg files...${normal}"
	sudo ln -vsf "$(pwd)"/xorg.conf /etc/X11/xorg.conf
	sudo ln -vsf "$(pwd)"/xorg.conf.d/* /etc/X11/xorg.conf.d/
}

download_stuff() {
	echo "${bold}Downloading rofi themes...${normal}"
	git clone https://github.com/davatorium/rofi-themes.git && mv rofi-themes/User\ Themes/*.rasi ~/.config/rofi/ && rm -rf rofi-themes

	echo "${bold}Downloading TeX Live netinstall to ~/Downloads...${normal}"
	wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -P ~/Downloads

	echo "${bold}Downloading Zotero addons to ~/Downloads...${normal}"
	wget https://github.com/bwiernik/zotero-shortdoi/releases/latest/download/zotero-shortdoi-1.3.9.xpi -P ~/Downloads
	wget https://github.com/retorquere/zotero-better-bibtex/releases/latest/download/zotero-better-bibtex-5.2.70.xpi -P ~/Downloads
	wget https://github.com/jlegewie/zotfile/releases/latest/download/zotfile-5.0.16-fx.xpi -P ~/Downloads
	wget https://github.com/willsALMANJ/Zutilo/releases/latest/download/zutilo.xpi -P ~/Downloads
	wget https://github.com/retorquere/zotero-storage-scanner/releases/latest/download/zotero-storage-scanner-5.0.8.xpi -P ~/Downloads
}

install_python() {
	echo "${bold}Downloading Miniconda to ~/Downloads...${normal}"
	wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Downloads/miniconda.sh
	chmod +x ~/Downloads/miniconda.sh
	~/Downloads/miniconda.sh -b -p "$HOME"/.anaconda3
	rm ~/Downloads/miniconda.sh
}

link_stuff
config_terminal
download_stuff
install_stuff
install_python
