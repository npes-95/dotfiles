autoload -Uz vcs_info # enable vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' %b%u '
setopt prompt_subst
PS1='[%n@%m:%~] '
RPROMPT='%f${vcs_info_msg_0_}%(?..[%?] )'

worker=async_vcs

function get_vcs_info() {
    cd -q $1
    vcs_info
    print ${vcs_info_msg_0_}
}

function on_got_vcs_info() {
    local err=$2
    local info=$3

    (( err == 0 )) || _async_handle_worker_err err

    vcs_info_msg_0_=$info
    zle reset-prompt
}

function precmd_vcs_info() {
    async_flush_jobs $worker
    async_job $worker get_vcs_info $PWD
}

function _async_init_worker () {
  async_start_worker $worker
  async_register_callback $worker on_got_vcs_info
}

function _async_handle_worker_err() {
  local err=$1
  # workaround for https://github.com/mafredri/zsh-async/issues/42
  if (( err == 2 )) || (( err == 3)) || (( err == 130 )); then
    async_stop_worker $worker
    _async_init_worker
  fi
}


async_init
_async_init_worker

precmd () { precmd_vcs_info } # always load before displaying the prompt
