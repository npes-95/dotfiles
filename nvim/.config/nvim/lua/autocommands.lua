vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
  augroup end
  augroup _git_settings
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown_settings
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _autoresize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
  augroup _term_settings
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup end
  augroup _autoformat
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end
  augroup _cursor_persist
    autocmd!
    autocmd BufRead * autocmd FileType <buffer> ++once
      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
  augroup end
]]
