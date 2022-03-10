# enable colors and change prompt:
autoload -U colors && colors  
setopt interactive_comments
setopt mark_dirs
setopt menucomplete
setopt nomatch
zle_highlight=('paste:none')

# history option
setopt hist_ignore_dups
setopt hist_ignore_space
setopt histignorealldups
autoload history-search-end

zsh_config="$HOME/.config/zsh"

source $zsh_config/env.zsh
source $zsh_config/utils.zsh
source $zsh_config/aliases.zsh
source $zsh_config/completion.zsh
source $zsh_config/plugins.zsh
source $zsh_config/prompt.zsh
source $zsh_config/thirdparty.zsh

has neofetch && neofetch
