# ---------------------------------
# zsh options
# ---------------------------------

# enable colors and change prompt:
autoload -U colors && colors  # Load colors
setopt interactive_comments

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)     # Include hidden files.

setopt mark_dirs

# history option
setopt hist_ignore_dups
setopt hist_ignore_space
setopt histignorealldups
autoload history-search-end

# ---------------------------------
# env variables
# ---------------------------------

# true colours for tmux
export TERM=xterm-256color

# detect os
[ -z "$OS" ] && export OS=`uname`
case "$OS" in
  Linux)          export PLATFORM=linux ;;
  *indows*)       export PLATFORM=windows ;;
  FreeBSD|Darwin) export PLATFORM=mac ;;
  *)              export PLATFORM=unknown ;;
esac

# homebrew
if [[ $PLATFORM == 'mac' ]]; then
    export PATH="/usr/local/Cellar:$PATH"
    export PATH="/usr/local/sbin:$PATH"
fi

# rust
if [[ -d $HOME/.cargo/bin ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# editor
export EDITOR='vim'

# ---------------------------------
# plugins
# ---------------------------------

# antibody
autoload -U +X compinit && compinit
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export ZSH_THEME=minimal_improved

