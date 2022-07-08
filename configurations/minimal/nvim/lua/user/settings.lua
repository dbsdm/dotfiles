local g = vim.o
local v = vim.g
local w = vim.wo
local b = vim.bo

--global options
g.swapfile = false
g.mouse = "a"
g.hidden = true
g.scrolloff = 7
g.timeoutlen = 500
g.laststatus= 3
g.termguicolors= true
g.sdf="/tmp/.viminfo"

--window local options
w.colorcolumn = "79"
w.number = true

--buffer local options
b.autoindent = true
b.tabstop = 4
b.softtabstop = 4
b.shiftwidth = 4
b.expandtab = true
b.autoindent = true
b.fileformat = "unix"
b.undofile = true
b.matchpairs = ""
b.filetype = "plugin"

--global vim opts
v.which_key_centered = 1
v.floaterm_width = 0.8
v.floaterm_height = 0.6

-- autocommands
-- vim.cmd [[autocmd CursorHoldI  * lua vim.lsp.buf.signature_help()]]
