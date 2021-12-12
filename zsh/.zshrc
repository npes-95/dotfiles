# ~/.zshrc

# profiling
#zmodload zsh/zprof

# enable colors and change prompt:
autoload -U colors && colors  
setopt interactive_comments
setopt mark_dirs

# history option
setopt hist_ignore_dups
setopt hist_ignore_space
setopt histignorealldups
autoload history-search-end

config_dir="$HOME/.config/zsh"

source $config_dir/env.zsh
source $config_dir/utils.zsh
source $config_dir/aliases.zsh
source $config_dir/completion.zsh
source $config_dir/prompt.zsh
source $config_dir/plugins.zsh
source $config_dir/thirdparty.zsh

has neofetch && neofetch

#zprof
