local wk = require('whichkey_setup')

local leader = {
    b = {
        name = "BUFFERS",
        n = "next",
        p = "previous",
    },
    d = "LINE DIAGNOSTICS",
    e = "TREE",
    f = {
        name = "FORMATTING",
        p = "prettier",
        b = "black",
        f = "built-in"
    },
    p = {
        name = "PYTHON",
        f = "run flake8 on file",
        i = "install lib under cursor",
    },
    r = {
        name = "REFACTORING",
        n = "rename",
        a = "code action",
    },
    s = {
        name = "SEARCH",
        s = "fuzzy files",
        b = "fuzzy buffers",
    },
}

local Goto = {
    d = "definition",
    D = "declaration",
    i = "implementations",
    r = "references",
    c = "comment/uncomment",
    cc = "comment/uncomment line"
}

wk.register_keymap('leader', leader)
wk.register_keymap('g', Goto)
