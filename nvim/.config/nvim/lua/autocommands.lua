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
  pattern = { "gitcommit", "markdown", "mail" },
  group = personal,
  command = "setlocal wrap | setlocal spell"
})

autocmd("FileType", {
  pattern = { "fugitive", "help" },
  group = personal,
  command = "setlocal laststatus=0"
})
