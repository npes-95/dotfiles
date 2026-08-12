has () {
    command -v "$1" >/dev/null 2>&1
}

# Run a function once, right after the first prompt draws, instead of
# blocking shell startup. Useful for slow `eval "$(tool init)"` style
# initializers (pyenv, nvm, direnv, ...) that don't need to be ready
# before the user sees a prompt.
autoload -Uz add-zsh-hook
zsh_defer () {
  local fn="$1" hook="_zsh_defer_$1"
  eval "$hook() { add-zsh-hook -d precmd $hook; $fn }"
  add-zsh-hook precmd "$hook"
}

reload () {
    exec $SHELL
}

prof () {
    for i in {1..10}; do time zsh -i -c exit; done
}

zconf () {
  pushd "$zsh_config"
  $EDITOR "$zsh_config/init.zsh"
  popd
}

calc () {
  echo $(($@))
}
