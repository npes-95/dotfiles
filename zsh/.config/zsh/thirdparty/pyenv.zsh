export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"

# pyenv init + virtualenv-init together cost ~0.5s here (each forks the
# pyenv binary). Defer them until right after the first prompt draws so
# they don't block shell startup; shims are already on PATH above, so
# python/pip resolve correctly in the meantime.
function _zsh_load_pyenv () {
  eval "$(command pyenv init -)"
  eval "$(command pyenv virtualenv-init -)"
}
zsh_defer _zsh_load_pyenv
