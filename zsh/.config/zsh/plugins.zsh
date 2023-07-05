function zsh_add_file () {
    [ -f "$zsh_config/$1" ] && source "$zsh_config/$1"
}

function zsh_add_plugin () {
    plugin_name="$(echo $1 | cut -d "/" -f 2)"
    alternative_name="$3"
    if [ -d "$zsh_config/plugins/$plugin_name" ]; then
        zsh_add_file "plugins/$plugin_name/$plugin_name.plugin.zsh" || \
        zsh_add_file "plugins/$plugin_name/$plugin_name.zsh" || \
        zsh_add_file "plugins/$plugin_name/$alternative_name.zsh"
    else
        git clone -b $2 "https://github.com/$1.git" "$zsh_config/plugins/$plugin_name"
    fi
}

zsh_add_plugin zsh-users/zsh-syntax-highlighting 0.7.1
zsh_add_plugin zsh-users/zsh-autosuggestions v0.7.0
zsh_add_plugin mafredri/zsh-async v1.8.6 async
