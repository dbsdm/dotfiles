----------------------------------- SETUP ------------------------------------

-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1", "https://github.com/wbthomason/packer.nvim", install_path, }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically sync on write
vim.cmd [[
  augroup packer_user_config
    autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync 
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

----------------------------------- PLUGINS ----------------------------------

packer.startup(function()

  ------------------------------- GENERAL ------------------------------------

  use "wbthomason/packer.nvim"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "akinsho/toggleterm.nvim"
  use "windwp/nvim-autopairs"
  use "godlygeek/tabular"
  use "simrat39/symbols-outline.nvim"
  use {
    'kyazdani42/nvim-tree.lua',
    requires = "kyazdani42/nvim-web-devicons"
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
        "kyazdani42/nvim-web-devicons",
        'nvim-lua/plenary.nvim',
    }
  }

  ------------------------------- THEMES -------------------------------------

  -- colorful
  use "morhetz/gruvbox"
  use "NLKNguyen/papercolor-theme"
  -- monotone
  use "dbsdm/jet"
  use "zekzekus/menguless"
  use "robertmeta/nofrils"
  use "jaredgorski/fogbell.vim"
  use "kadekillary/skull-vim"
  use "davidosomething/vim-colors-meh"


  ------------------------------- VISUALS ------------------------------------

  use "nvim-lualine/lualine.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use "norcalli/nvim-colorizer.lua"
  use "folke/zen-mode.nvim"
  use "folke/which-key.nvim"
  use "sakshamgupta05/vim-todo-highlight"
  use "antoinemadec/FixCursorHold.nvim"
  use {
    "kosayoda/nvim-lightbulb",
    requires = "antoinemadec/FixCursorHold.nvim"
  }
  use {
    "alvarosevilla95/luatab.nvim",
    config = function() require("luatab").setup() end
  }
  use {
    "winston0410/range-highlight.nvim",
    requires = "winston0410/cmd-parser.nvim",
    config = function() require("range-highlight").setup() end
  }
  use {
    "folke/twilight.nvim",
    config = function() require("twilight").setup() end
  }

  --------------------------------- GIT --------------------------------------

  use "lewis6991/gitsigns.nvim"

  --------------------------- LSP & COMPLETION -------------------------------

  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "weilbith/nvim-code-action-menu"
  use "rafamadriz/friendly-snippets"
  use "simrat39/rust-tools.nvim"
  use "ahmedkhalf/project.nvim"

  -------------------------- COMPLETION SOURCES ------------------------------

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "saadparwaiz1/cmp_luasnip",
    requires = "L3MON4D3/LuaSnip"
  }
  use {
    "tzachar/cmp-tabnine",
    run='./install.sh',
  }
  use "onsails/lspkind.nvim"

  -------------------- Sync After Bootstraping Packer ------------------------
  if PACKER_BOOTSTRAP then
      require('packer').sync()
  end
end)
