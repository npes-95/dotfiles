# ~/.config/zsh/env.zsh

# true colours for tmux
export TERM=xterm-256color

# detect os
[[ -z "$OS" ]] && export OS=`uname`
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
export EDITOR='nvim'

