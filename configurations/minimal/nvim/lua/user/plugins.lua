----------------------------------- SETUP ------------------------------------

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1", "https://github.com/wbthomason/packer.nvim", install_path, }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync 
    augroup end
]]
-- Use a protected call to avoid errors on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end
-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }, }

----------------------------------- PLUGINS ----------------------------------

return require("packer").startup(function()

    ------------------------------- GENERAL ----------------------------------

    -- packer
    use "wbthomason/packer.nvim"
    -- dot repeat for third-party plugins
    use "tpope/vim-repeat"
    -- surround text
    use "tpope/vim-surround"
    -- comment and uncomment with one map
    use "tpope/vim-commentary"
    -- floating terminal
    use "akinsho/toggleterm.nvim"
    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }
    -- line up text in columns
    use "godlygeek/tabular"
    -- symbols outline(tags)
    use "simrat39/symbols-outline.nvim"
    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = "kyazdani42/nvim-web-devicons"
    }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            "kyazdani42/nvim-web-devicons",
            'nvim-lua/plenary.nvim',
        }
    }


    ------------------------------- THEMES -----------------------------------

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


    ------------------------------- VISUALS ----------------------------------

    -- lualine
    use "nvim-lualine/lualine.nvim"
    -- treesitter
    use "nvim-treesitter/nvim-treesitter"
    -- highlight hex and rgb color codes
    use "norcalli/nvim-colorizer.lua"
    -- zen mode
    use "folke/zen-mode.nvim"
    -- tabline
    use {
        "alvarosevilla95/luatab.nvim",
        config = function() require("luatab").setup() end
    }
    -- highlight selected range
    use {
        "winston0410/range-highlight.nvim",
        requires = "winston0410/cmd-parser.nvim",
        config = function() require("range-highlight").setup() end
    }
    -- dimming code using treesitter
    use {
        "folke/twilight.nvim",
        config = function() require("twilight").setup() end
    }
    -- whichkey
    use {
        "folke/which-key.nvim",
        config = function() require("which-key").setup() end
    }
    -- todo and fixme highlight
    use "sakshamgupta05/vim-todo-highlight"

    --------------------------------- GIT ------------------------------------

    -- gitsigns
    use "lewis6991/gitsigns.nvim"

    --------------------------- LSP & COMPLETION -----------------------------

    -- built-in LSP
    use "neovim/nvim-lspconfig"
    -- autocompletion
    use "hrsh7th/nvim-cmp"
    -- LSP servers installer
    use "williamboman/nvim-lsp-installer"
    -- code action menu
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }
    -- collection of snippets for different languages
    use "rafamadriz/friendly-snippets"
    use "simrat39/rust-tools.nvim"

    -------------------------- COMPLETION SOURCES ----------------------------

    -- from LSP servers
    use "hrsh7th/cmp-nvim-lsp" -- from built-in LSP
    -- from path
    use "hrsh7th/cmp-path" -- from path
    -- from snippets
    use {
        "saadparwaiz1/cmp_luasnip",
        requires = "L3MON4D3/LuaSnip"
    }

    -------------------- Sync After Bootstraping Packer ----------------------
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
