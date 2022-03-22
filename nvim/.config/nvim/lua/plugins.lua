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

--Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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
  use "nvim-lua/popup.nvim" --an implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" --useful lua functions used by lots of plugins
  use "lewis6991/impatient.nvim" --improve startup time
  use "antoinemadec/FixCursorHold.nvim" --needed to fix lsp doc highlight
  --qol
  use "windwp/nvim-autopairs" --autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" --easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua" --file tree
  use "akinsho/toggleterm.nvim" --terminal window manager
  use "folke/which-key.nvim" --keymap prompt
  use "nvim-telescope/telescope.nvim" --fuzzy finder
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --fzf extension for telescope
  use "lewis6991/gitsigns.nvim" --git integration
  --pretty
  use "nvim-lualine/lualine.nvim" --nice status bar
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
  use {'kdheepak/monochrome.nvim', config = function()
    vim.cmd 'colorscheme monochrome'
  end}

  --Automatically set up your configuration after cloning packer.nvim
  --Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
