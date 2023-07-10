local fn = vim.fn

--Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer, please close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

--Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

--Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  --plugin manager
  use "wbthomason/packer.nvim" --have packer manage itself

  --utils
  use {
    "nvim-lua/popup.nvim", --an implementation of the popup API from vim in Neovim
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use "lewis6991/impatient.nvim" --improve startup time
  use "antoinemadec/FixCursorHold.nvim" --needed to fix lsp doc highlight

  --qol
  use {
    "kyazdani42/nvim-tree.lua", -- file tree
    requires = { { "kyazdani42/nvim-web-devicons" } } -- optional, for file icons
  }
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.*", -- fuzzy finder
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use "folke/which-key.nvim" --keymap prompt
  use { "akinsho/toggleterm.nvim", tag = "v2.*" } --terminal window manager
  use "windwp/nvim-autopairs" --autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" --easily comment stuff
  use { "lewis6991/gitsigns.nvim" } --git integration

  --pretty
  use {
    "nvim-lualine/lualine.nvim", --nice status bar
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  --cmp
  use "hrsh7th/nvim-cmp" --the completion plugin
  use "hrsh7th/cmp-buffer" --buffer completions
  use "hrsh7th/cmp-path" --path completions
  use "hrsh7th/cmp-cmdline" --cmdline completions
  use "saadparwaiz1/cmp_luasnip" --snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  --snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" --a bunch of snippets to use

  --lsp
  use "neovim/nvim-lspconfig" --enable lsp
  use "williamboman/nvim-lsp-installer" --simple to use language server installer
  use "tamago324/nlsp-settings.nvim" --language server settings defined in json format

  --treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  --colorscheme
  use { "rose-pine/neovim", as = "rose-pine", config = function()
    vim.cmd "colorscheme rose-pine"
  end }

  --Automatically set up your configuration after cloning packer.nvim
  --Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
