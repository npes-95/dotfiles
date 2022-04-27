thirdparty_dir="$HOME/.config/zsh/thirdparty"

[[ -d /opt/homebrew ]] && source $thirdparty_dir/brew.zsh
[[ -d $HOME/.cargo ]] && source $thirdparty_dir/cargo.zsh

has fnm && source $thirdparty_dir/fnm.zsh
has fzf && source $thirdparty_dir/fzf.zsh
has git && source $thirdparty_dir/git.zsh
has nvim && source $thirdparty_dir/nvim.zsh
has tmux && source $thirdparty_dir/tmux.zsh
has yabai && source $thirdparty_dir/yabai.zsh
