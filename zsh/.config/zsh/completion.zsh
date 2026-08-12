if [[ "$OS" == "Darwin" ]] && [[ -d /opt/homebrew/share/zsh-completions ]]; then
  FPATH="/opt/homebrew/share/zsh-completions:$FPATH"
fi

# basic auto/tab complete:
autoload -Uz compinit

zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

# load completions instantly from the cached dump; never block startup on
# the security audit or a staleness check
compinit -C -d "$zcompdump"

# once a day, regenerate the dump (picking up newly installed completions
# and re-running the audit) in the background, ready for the next shell
if [[ ! -s "$zcompdump" || -n ${zcompdump}(#qN.mh+24) ]]; then
  { compinit -u -d "$zcompdump" } &!
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
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
