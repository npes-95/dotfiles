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


