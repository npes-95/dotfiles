thirdparty_dir="$HOME/.config/zsh/thirdparty"

[[ -d /opt/homebrew ]] && source "$thirdparty_dir/brew.zsh"
[[ -d "$HOME/.cargo" ]] && source "$thirdparty_dir/cargo.zsh"

has fnm && source "$thirdparty_dir/fnm.zsh"
has fzf && source "$thirdparty_dir/fzf.zsh"
has git && source "$thirdparty_dir/git.zsh"
has launchctl && source "$thirdparty_dir/launchctl.zsh"
has mpv && source "$thirdparty_dir/mpv.zsh"
has nvim && source "$thirdparty_dir/nvim.zsh"
has restic && source "$thirdparty_dir/restic.zsh"
has rsync && source "$thirdparty_dir/rsync.zsh"
has todo.sh && source "$thirdparty_dir/todo.zsh"
