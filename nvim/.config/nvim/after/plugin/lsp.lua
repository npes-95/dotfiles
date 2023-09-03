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
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()
