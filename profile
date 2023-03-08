export ZDOTDIR="$HOME/.config/zsh"

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# StarCraft 2 path, used by pysc2
export SC2PATH="/opt/StarCraftII"
export MICRORTSPATH="$HOME/Code/microrts/bin/microrts.jar"

export PATH="$PATH:$HOME/.anaconda3/bin"
export PATH="$HOME/.texlive/2021/bin/x86_64-linux:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export MANPATH="$HOME/.texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.texlive/2021/texmf-dist/doc/info:$INFOPATH"

#this is supposed to fix Java GUI applications in bspwm
export _JAVA_AWT_WM_NONREPARENTING=1
#this fixes jagged fonts in Java software such as Chatty
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

export CPATH="$HOME/.anaconda3/include:$CPATH"
export LD_LIBRARY_PATH="/usr/lib:/home/dodo/.anaconda3/lib"

# variables necessary by Malmo and MarLo
# export MALMO_MINECRAFT_ROOT=$HOME/MalmoPlatform/Minecraft
# export MALMO_XSD_PATH=$HOME/MalmoPlatform/Schemas
# this is a nuisance when not using Malmo, so only uncomment it when doing Malmo-related experiments
# export TERM=xterm

export PATH="$PATH:$HOME/.perl5/bin"
export PERL5LIB="$HOME/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/.perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export TERMINAL="alacritty"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

##### things that xdg-ninja recommended
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GEM_HOME="${XDG_DATA_HOME}"/gem
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}"/gem
# Note: from the archwiki:
# If you use non-default GnuPG Home directory, you will need to edit all socket files to use the values of gpgconf --list-dirs. If you set your SSH_AUTH_SOCK manually, keep in mind that your socket location may be different if you are using a custom GNUPGHOME
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export PYLINTHOME="${XDG_CACHE_HOME}"/pylint
export KDEHOME="$XDG_CONFIG_HOME"/kde
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
alias mocp=mocp -M "$XDG_CONFIG_HOME"/moc
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
alias nvidia-settings=nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings
# Disclaimer: some applications don't respect this setting
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export TEXMFHOME="$XDG_DATA_HOME"/texmf
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export W3M_DIR="$XDG_DATA_HOME"/w3m
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

source ${HOME}/Documents/profile_private.sh