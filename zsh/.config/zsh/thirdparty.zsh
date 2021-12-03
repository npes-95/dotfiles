# ~/.config/zsh/thirdparty.zsh

thirdparty_dir="$HOME/.config/zsh/thirdparty"

has brew && source $thirdparty_dir/brew.zsh
has cargo && source $thirdparty_dir/cargo.zsh
has fzf && source $thirdparty_dir/fzf.zsh
has nvim && source $thirdparty_dir/nvim.zsh
has tmux && source $thirdparty_dir/tmux.zsh
has yabai && source $thirdparty_dir/yabai.zsh
