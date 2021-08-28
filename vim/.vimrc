" ~/.vimrc

syntax enable

set nocompatible

set cursorline
set ttyfast
set showmode
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set encoding=utf-8

" search down into subfolders 
set path+=**

" display all matching files when we tab
set wildmenu

filetype plugin on
filetype plugin indent on

" make backspace work on macos
if $PLATFORM =~ 'mac'
    set backspace=indent,eol,start
endif

" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

so ~/.vim/plugins.vim

" auto format rust files
let g:rustfmt_autosave = 1

" auto format c++ files
let g:clang_format#auto_format=1

" coc extensions
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-clangd', 'coc-python', 'coc-sh', 'coc-cmake', 'coc-json']

" match terminal/vim colours
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme base16-default-dark

" transparent background
hi! Normal ctermbg=NONE guibg=NONE
