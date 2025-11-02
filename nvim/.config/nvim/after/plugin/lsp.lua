local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "clangd",
  "rust_analyzer",
  "jedi_language_server",
  "bashls",
  "cmake",
  "lua_ls",
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }

  lsp.default_keymaps(opts)

  vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)

  vim.keymap.set("n", "<leader>lr", function()
    vim.lsp.buf.rename()
  end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
