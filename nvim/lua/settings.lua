local o = vim.o
local vg = vim.g
local wo = vim.wo
local bo = vim.bo

--global options
o.swapfile = false
o.mouse = "a"
o.hidden = true
o.scrolloff = 7
o.timeoutlen = 500
o.laststatus=3
o.termguicolors=true

--window local options
wo.colorcolumn = "79"
wo.number = true

--buffer local options
bo.autoindent = true
bo.tabstop = 4
bo.softtabstop = 4
bo.shiftwidth = 4
bo.expandtab = true
bo.autoindent = true
bo.fileformat = "unix"

--global vim opts
vg.user_emmet_leader_key = "<C-Z>" -- trailing ',' required
vg.gruvbox_transparent_bg = 1
vg.which_key_centered = 0

--misc
vim.cmd [[filetype plugin on]]
vim.cmd [[autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE]]
