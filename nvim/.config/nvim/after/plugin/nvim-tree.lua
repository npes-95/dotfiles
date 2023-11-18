vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  on_attach = function ()
    local api = require "nvim-tree.api"

    vim.keymap.set("n", "h", api.node.navigate.parent_close)
    vim.keymap.set("n", "l", api.node.open.edit)
  end
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
