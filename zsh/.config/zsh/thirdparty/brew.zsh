# ~/.config/zsh/thirdparty/brew.zsh

if [[ $PLATFORM == 'mac' ]]; then
    export PATH="/usr/local/Cellar:$PATH"
    export PATH="/usr/local/sbin:$PATH"
fi

