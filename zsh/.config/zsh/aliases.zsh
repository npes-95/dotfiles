alias c="clear"
alias ls="ls --color"
alias la="ls -la --color"
alias du="du -ch"
alias df="df -h"
alias wtr="curl https://wttr.in/Berlin && printf '\n'"
alias diff="diff --color=auto"

has xdg-open && alias open="xdg-open"

[[ -d "$HOME/dotfiles" ]] && alias cdd="cd $HOME/dotfiles"
[[ -d "$HOME/repos" ]] && alias cdr="cd $HOME/repos"
