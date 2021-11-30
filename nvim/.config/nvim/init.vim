" ~/.config/nvim/init.vim

set nocompatible                    " disable compatibility to vi
set showmatch                       " show matching 
set ignorecase                      " case insensitive 
set hlsearch                        " highlight search 
set incsearch                       " incremental search
set tabstop=4                       " number of columns occupied by a tab 
set softtabstop=4                   " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                       " converts tabs to white space
set shiftwidth=4                    " width for autoindents
set autoindent                      " indent a new line the same amount as the line just typed
set smartindent
set number                          " add line numbers
set wildmode=longest,list           " get bash-like tab completions
filetype plugin indent on           " allow auto-indenting depending on file type
set clipboard=unnamedplus           " using system clipboard
filetype plugin on
set cursorline                      " highlight current cursorline
set ttyfast                         " speed up scrolling in Vim
set cursorline                      " use line when in insert mode
set nowrap
set smartcase
set noswapfile
set nobackup
set encoding=utf-8
set path+=**                        " search down into subfolders 
set wildmenu                        " display all matching files when we tab

nnoremap <C-r> :checktime<CR>

so ~/.config/nvim/plugins.vim       " load and configure plugins
so ~/.config/nvim/onstart.vim       " load autocommands
