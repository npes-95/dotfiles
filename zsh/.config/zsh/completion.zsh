if [[ $PLATFORM == 'mac' ]] && [[ -d /opt/homebrew/share/zsh-completions ]]; then
  FPATH="/opt/homebrew/share/zsh-completions:$FPATH"
fi

# basic auto/tab complete:
autoload -Uz compinit

if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

zmodload zsh/complist

# include hidden files
_comp_options+=(globdots)     

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*' menu select

# compile zcompdump in background, if modified, to increase startup speed.
{
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
