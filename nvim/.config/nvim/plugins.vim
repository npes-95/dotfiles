" ~/.config/nvim/plugins.vim

" install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/base-16.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/cpp.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/rust.vim

call plug#end()

doautocmd User PlugLoaded

syntax enable
if exists('+termguicolors')
    set termguicolors
endif


