local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local personal = augroup("personal", {})

autocmd("TextYankPost", {
  group = personal,
  callback = function()
      vim.highlight.on_yank({
          higroup = "Visual",
          timeout = 150,
      })
  end,
})

autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "mail", "text" },
  group = personal,
  command = "setlocal wrap | setlocal spell"
})

autocmd("TermOpen", {
  group = personal,
  command = "setlocal listchars= nonumber norelativenumber"
})

autocmd("BufWritePre", {
  pattern = { "*.h", "*.c", "*.cpp" },
  group = personal,
  callback = function(ev)
    cursor_pos = vim.fn.getpos(".")
    pcall(function() vim.cmd([[%s/\s\+$//e]]) end)
    vim.fn.setpos(".", cursor_pos)
  end,
})
