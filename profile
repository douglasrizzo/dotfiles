export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# adding TensorFlow models directory to our path
export PYTHONPATH="$PYTHONPATH:$HOME/Code/models/research:$HOME/Code/models/research/slim"

# StarCraft 2 path, used by pysc2
export SC2PATH="/opt/StarCraftII"

export PATH="$PATH:$HOME/.anaconda3/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.texlive/2019/bin/x86_64-linux"
export MANPATH="$HOME/.texlive/2019/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.texlive/2019/texmf-dist/doc/info:$INFOPATH"

#this is supposed to fix Java GUI applications in bspwm
export _JAVA_AWT_WM_NONREPARENTING=1

# variables necessary by Malmo and MarLo
# export MALMO_MINECRAFT_ROOT=$HOME/MalmoPlatform/Minecraft
# export MALMO_XSD_PATH=$HOME/MalmoPlatform/Schemas
# this is a nuisance when not using Malmo, so only uncomment it when doing Malmo-related experiments
# export TERM=xterm

PATH="$HOME/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"; export PERL_MM_OPT;

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa