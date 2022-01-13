# ~/.config/zsh/prompt.zsh

autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' / %b%u'
setopt prompt_subst
PS1='%1~%f${vcs_info_msg_0_} > '
