vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local FLOAT_HEIGHT_RATIO = 0.8
local FLOAT_WIDTH_RATIO = 0.5

require("nvim-tree").setup {
  on_attach = function (bufnr)
    local api = require "nvim-tree.api"

    local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
    vim.keymap.set("n", "l", api.node.open.edit, opts)
  end,
  view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * FLOAT_WIDTH_RATIO
          local window_h = screen_h * FLOAT_HEIGHT_RATIO
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

          return {
            border = 'rounded',
            relative = 'editor',
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
          end,
      },
      width = function()
        return math.floor(vim.opt.columns:get() * FLOAT_WIDTH_RATIO)
      end,
    },
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
