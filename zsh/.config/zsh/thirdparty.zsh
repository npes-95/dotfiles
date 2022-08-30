thirdparty_dir="$HOME/.config/zsh/thirdparty"

[[ -d /opt/homebrew ]] && source $thirdparty_dir/brew.zsh
[[ -d $HOME/.cargo ]] && source $thirdparty_dir/cargo.zsh

has fnm && source $thirdparty_dir/fnm.zsh
has fzf && source $thirdparty_dir/fzf.zsh
has git && source $thirdparty_dir/git.zsh
has launchctl && source $thirdparty_dir/launchctl.zsh
has nvim && source $thirdparty_dir/nvim.zsh
has rsync && source $thirdparty_dir/rsync.zsh
has tmux && source $thirdparty_dir/tmux.zsh
has todo.sh && source $thirdparty_dir/todo.zsh
