-- bootstrap lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {"c", "cpp", "lua", "rust", "python",
          "javascript", "bash", "json", "latex", "make",
          "html", "cmake", "markdown", "vim", "vimdoc",
          "gitcommit", "gitignore", "haskell"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        additional_vim_regex_highlighting = false,
      })
    end
  },
  {
    "theprimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "mbbill/undotree" },
  { "lewis6991/gitsigns.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd", "rust_analyzer", "jedi_language_server", "bashls", "cmake", "lua_ls"
      }
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig"
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "petertriho/cmp-git",
      "neovim/nvim-lspconfig"
    }
  }
}

require("lazy").setup(plugins, {})
