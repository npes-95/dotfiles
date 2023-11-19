local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

vim.keymap.set("n", "<S-l>", ui.nav_next)
vim.keymap.set("n", "<S-h>", ui.nav_prev)
