" ~/.config/nvim/plugins/nvim-tree.vim

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

autocmd User PlugLoaded ++nested lua require'nvim-tree'.setup { auto_close = true }

nnoremap <C-n> :NvimTreeToggle<CR>

