# ~/.config/zsh/utils.zsh

has () {
    eval hash $1 2>/dev/null
}

reload () {
    # see https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#how-do-i-reload-the-zshrc-file
    exec zsh
}

prof () {
    for i in {1..10}; do time zsh -i -c exit; done
}

function zsh_add_file () {
    [ -f "$zsh_config/$1" ] && source "$zsh_config/$1"
}

function zsh_add_plugin () {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$zsh_config/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$zsh_config/plugins/$PLUGIN_NAME"
    fi
}

function zsh_add_completion() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$zsh_config/plugins/$PLUGIN_NAME" ]; then 
        # For completions
		completion_file_path=$(ls $zsh_config/plugins/$PLUGIN_NAME/_*)
		fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$zsh_config/plugins/$PLUGIN_NAME"
		fpath+=$(ls $zsh_config/plugins/$PLUGIN_NAME/_*)
        [ -f $zsh_config/.zccompdump ] && $zsh_config/.zccompdump
    fi
	completion_file="$(basename "${completion_file_path}")"
	if [ "$2" = true ] && compinit "${completion_file:1}"
}
