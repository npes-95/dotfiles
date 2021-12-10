# ~/.config/zsh/utils.zsh

has () {
    return $(hash $1 2>/dev/null)
}

reload () {
    # see https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#how-do-i-reload-the-zshrc-file
    exec zsh
}
