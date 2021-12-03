# ~/.config/zsh/plugins/fzf.zsh

if [[ $PLATFORM == 'mac' ]]; then
    [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
else
    source /usr/share/fzf/shell/key-bindings.zsh
    source /usr/share/fzf/shell/completion.zsh
fi


# use fd to generate path candidates
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
