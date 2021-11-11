" ~/.config/nvim/plugins.vim

" install vim-plug if not found

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins 
call plug#begin('~/.vim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chriskempson/base16-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}
Plug 'pechorin/any-jump.vim'
Plug 'junegunn/fzf.vim'

call plug#end()

" nvim-tree
lua require'nvim-tree'.setup()

" coc extensions
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-clangd', 'coc-python', 'coc-sh', 'coc-cmake', 'coc-json']

" configuration
let g:rustfmt_autosave = 1          " auto format rust files
let g:clang_format#auto_format=1    " auto format c++ files

" theme
syntax enable
colorscheme base16-default-dark
if exists('+termguicolors')
    set termguicolors
endif
