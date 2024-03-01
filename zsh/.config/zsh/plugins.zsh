zsh_plugin_dir="$HOME/.local/share/zsh/plugins"

function try_source () {
  [ -f "$1" ] && source "$1"
}

function zsh_add_plugin () {
  plugin_name="$(echo $1 | cut -d "/" -f 2)"
  plugin_dir="$zsh_plugin_dir/$plugin_name"
  alternative_name="$3"
  if [ -d  "$plugin_dir" ]; then
    try_source "$plugin_dir/$plugin_name.plugin.zsh" || \
    try_source "$plugin_dir/$plugin_name.zsh" || \
    try_source "$plugin_dir/$alternative_name.zsh"
  else
    git clone -b $2 "https://github.com/$1.git" "$plugin_dir"
  fi
}

zsh_add_plugin zsh-users/zsh-syntax-highlighting 0.7.1
zsh_add_plugin zsh-users/zsh-autosuggestions v0.7.0
zsh_add_plugin mafredri/zsh-async v1.8.6 async
