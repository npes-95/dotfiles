# ~/.config/zsh/plugins/yabai.zsh

next_or_wrap() {
    yabai -m space --focus next || yabai -m space --focus first
}
