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
    plugin_name=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$zsh_config/plugins/$plugin_name" ]; then
        zsh_add_file "plugins/$plugin_name/$plugin_name.plugin.zsh" || \
        zsh_add_file "plugins/$plugin_name/$plugin_name.zsh"
    else
        git clone "https://github.com/$1.git" "$zsh_config/plugins/$plugin_name"
    fi
}

function zsh_add_completion() {
    plugin_name=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$zsh_config/plugins/$plugin_name" ]; then
		    completion_file_path=$(ls $zsh_config/plugins/$plugin_name/_*)
		    fpath+="$(dirname "${completion_file_path}")"
        zsh_add_file "plugins/$plugin_name/$plugin_name.plugin.zsh"
    else
        git clone "https://github.com/$1.git" "$zsh_config/plugins/$plugin_name"
		    fpath+=$(ls $zsh_config/plugins/$plugin_name/_*)
        [ -f $zsh_config/.zccompdump ] && $zsh_config/.zccompdump
    fi
	  completion_file="$(basename "${completion_file_path}")"
  	if [ "$2" = true ] && compinit "${completion_file:1}"
}
