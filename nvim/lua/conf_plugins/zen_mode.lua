require 'zen-mode'.setup{
    window = {
        backdrop = 1,
        width = 100,
        height = .8,
        options = {
            --signcolumn = "no", -- disable signcolumn
            --number = false, -- disable number column
            --relativenumber = false, -- disable relative numbers
            --cursorline = false, -- disable cursorline
            --cursorcolumn = false, -- disable cursor column
            --foldcolumn = "0", -- disable fold column
            --list = false, -- disable whitespace characters
        },
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
        },
        twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = true }, -- disables git signs
        tmux = { enabled = true }, -- disables the tmux statusline
        kitty = {
            enabled = false,
            font = "+4", -- font size increment
        },
    },
}
