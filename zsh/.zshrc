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

# aliases
alias c="clear"

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
# prompt
# ---------------------------------

autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' / %b' # ' main'
PS1='%F{yellow}%1~%f$vcs_info_msg_0_ > '

# ---------------------------------
# plugins
# ---------------------------------

# antibody
autoload -U +X compinit && compinit
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt
