# ~/.zshrc

# enable colors and change prompt:
autoload -U colors && colors  
setopt interactive_comments
setopt mark_dirs

# history option
setopt hist_ignore_dups
setopt hist_ignore_space
setopt histignorealldups
autoload history-search-end

source ~/.config/zsh/env.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/prompt.zsh

# helper scripts
source ~/.scripts/*
