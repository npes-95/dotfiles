export LANG=en_US.UTF-8
export HISTFILE="$HOME/.zsh_history"

has vim && export EDITOR=vim || export EDITOR=vi
has uname && export OS="$(uname)" || export OS=Unknown
