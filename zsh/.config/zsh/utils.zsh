# ~/.config/zsh/utils.zsh

has () {
    return $(hash $1 2>/dev/null)
}
