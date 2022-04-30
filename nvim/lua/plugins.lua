return require("packer").startup(function()

    use "wbthomason/packer.nvim" -- let Packer manage itself
    use "morhetz/gruvbox" -- colorscheme
    use "nvim-lualine/lualine.nvim" -- lualine
    use "tpope/vim-repeat" -- repeat('.') for plugins
    use "tpope/vim-surround" -- surround
    use "tpope/vim-commentary" -- comments
    use "windwp/nvim-autopairs" -- autopairs
    use "lewis6991/gitsigns.nvim" -- gitsigns
    use "kien/ctrlp.vim" -- fuzzy finder
    -- FILE TREE
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    }
    -- EMMET
    use {
        "mattn/emmet-vim",
        ft = { "html", "css" }
    }
    -- MAP HINTS
    use {
        "AckslD/nvim-whichkey-setup.lua",
        requires = { "liuchengxu/vim-which-key" },
    }
    -- TREESITTER
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate'
    }
    -- LSP and COMPLETION
    use "neovim/nvim-lspconfig" -- built-in LSP
    use "hrsh7th/nvim-cmp" -- autocompletion
    use "williamboman/nvim-lsp-installer" -- LSP servers installer

    -- COMPLETION SOURCES
    use "hrsh7th/cmp-nvim-lsp" -- from built-in LSP
    use "hrsh7th/cmp-path" -- from path
    use {
        "saadparwaiz1/cmp_luasnip", -- from LuaSnip
        requires = "L3MON4D3/LuaSnip"
    }

end)
