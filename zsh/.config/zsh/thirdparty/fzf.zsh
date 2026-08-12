fzf_share=""
for fzf_share in /opt/homebrew/opt/fzf/shell /usr/local/opt/fzf/shell; do
  [[ -r "$fzf_share/completion.zsh" ]] && break
done

if [[ -n "$fzf_share" && -r "$fzf_share/completion.zsh" ]]; then
  source "$fzf_share/completion.zsh"
  source "$fzf_share/key-bindings.zsh"
else
  source <(fzf --zsh)
fi
unset fzf_share
