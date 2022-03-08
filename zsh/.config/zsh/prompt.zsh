# ~/.config/zsh/prompt.zsh

autoload -Uz vcs_info # enable vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats ' / %b%u'
setopt prompt_subst
PS1='%1~%f${vcs_info_msg_0_} > '

worker=async_vcs

function _async_vcs_info() {
    cd -q $1
    vcs_info
    print ${vcs_info_msg_0_}
}

function _async_vcs_info_cb() {
    local info=$3
    vcs_info_msg_0_=$info
    zle reset-prompt
}

function _async_precmd() {
    async_flush_jobs $worker
    async_job $worker _async_vcs_info $PWD
}

async_init
async_start_worker $worker
async_register_callback $worker _async_vcs_info_cb

precmd () { _async_precmd } # always load before displaying the prompt
