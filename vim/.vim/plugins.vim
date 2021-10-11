" ~/.vim/plugins.vim

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
