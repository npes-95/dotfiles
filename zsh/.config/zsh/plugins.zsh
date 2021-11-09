# /.config/zsh/plugins.zsh

reload_plugins() {
    antibody bundle < ~/.config/zsh/plugins.txt > ~/.config/zsh/plugins.sh
    source ~/.config/zsh/plugins.sh
}

autoload -U +X compinit && compinit

if [[ ! -e ~/.config/zsh/plugins.sh ]]; then
    antibody bundle < ~/.config/zsh/plugins.txt > ~/.config/zsh/plugins.sh
fi

source ~/.config/zsh/plugins.sh
