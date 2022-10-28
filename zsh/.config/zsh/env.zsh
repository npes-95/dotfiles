export LANG=en_US.UTF-8

has vim && export EDITOR=vim || export EDITOR=vi
has uname && export OS="$(uname)" || export OS=Unknown
