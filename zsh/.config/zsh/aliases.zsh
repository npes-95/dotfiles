# ~/.config/zsh/aliases.zsh

alias c="clear"
alias td="todo.sh"
alias ret="echo $?"
alias ls="ls --color"
alias la="ls -la --color"

if [[ $PLATFORM == 'linux' ]]; then
    alias open="xdg-open"
fi


