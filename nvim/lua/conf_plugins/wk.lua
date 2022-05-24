
local wk = require("which-key")

----------------------------------- SETUP ------------------------------------

wk.setup({
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
})

------------------------------------ MAPS ------------------------------------

wk.register({
    b = {
        name = "BUFFER",
        n = { ":bnext<cr>", "next buffer" },
        p = { ":bprev<cr>", "prev buffer" },
    },
    c = {
        name = "COMPILE and/or RUN",
        p = { ":w <bar> FloatermNew --autoclose=0 python3 %<cr>", "Run file with Python3" },
        c = { ":w <bar> FloatermNew --autoclose=0 cargo run<cr>", "Build and run with Cargo" }
    },
    e = { ":NvimTreeToggle<cr>", "FILE TREE" },
    l = {
        name = "LSP",
        r = "rename",
        D = "type definition",
        a = "code action",
        f = "format file",
    },
    f = {
        name = "FIND",
        f = { ":Telescope find_files<cr>", "files" },
        h = { ":Telescope help_tags<cr>", "help tags" },
        m = { ":Telescope man_pages<cr>", "man pages" },
        d = { ":Telescope diagnostics<cr>", "diagnostics" },
    },
    u = {
        name = "UTILITIES",
        b = { ":w <bar> !python3 -m black %:p<cr>", "save & run Black" },
        c = { ":w <bar> !cargo fmt<cr>", "save & run CargoFmt" },
        p = { ":w <bar> !npx prettier --write %:p<cr>", "save & run Prettier" },
        f = { ":w <bar> !flake8 --ignore E501 %:p<cr>", "save & run Flake8" },
    },
    ["t"] = "which_key_ignore",
    z = { ":ZenMode<cr>", "ZEN MODE" }
}, { prefix = "<leader>" })

