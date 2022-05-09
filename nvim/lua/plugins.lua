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
    -- autopairs
    use "windwp/nvim-autopairs"
    -- fuzzy finder
    use "kien/ctrlp.vim"
    -- line up text in columns
    use "godlygeek/tabular"
    -- symbols outline(tags)
    use "simrat39/symbols-outline.nvim"
    -- file tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = "kyazdani42/nvim-web-devicons"
    }
    -- emmet
    use {
        "mattn/emmet-vim",
        ft = { "html", "css" }
    }

    ------------------------------- VISUALS ----------------------------------

    -- gruvbox theme
    use "morhetz/gruvbox"
    -- dracula theme
    use "Mofiqul/dracula.nvim"
    -- lualine
    use "nvim-lualine/lualine.nvim"
    -- treesitter
    use "nvim-treesitter/nvim-treesitter"
    -- highlight hex and rgb color codes
    use "lilydjwg/colorizer"
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
    -- lightbulb symbol for code actions
    use {
        "kosayoda/nvim-lightbulb",
        config = function() require("nvim-lightbulb").setup() end
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

    --------------------------------- GIT ------------------------------------

    -- gitsigns
    use "lewis6991/gitsigns.nvim"
    -- gitblame
    use "f-person/git-blame.nvim"

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

end)
