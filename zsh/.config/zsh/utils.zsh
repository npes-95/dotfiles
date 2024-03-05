has () {
    eval hash $1 2>/dev/null
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
