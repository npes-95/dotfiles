" ~/.config/nvim/plugins/fzf.vim

Plug 'junegunn/fzf.vim'

if $PLATFORM == 'mac'
    Plug '/usr/local/opt/fzf'
endif

nmap <C-p> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-h> :History<CR>
nmap <C-f> :Ag<cr>

