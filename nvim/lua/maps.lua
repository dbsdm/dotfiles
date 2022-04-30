local options = { noremap = true }
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

--leader
vim.g.mapleader = " "

-------------------------------  MAPS  ---------------------------------------
--insert
map("i", "jk", "<esc>", options) -- jk to enter normal mode
--normal
map("n", "nh", ":nohlsearch<cr>", options) -- no highlight
map("n", "<leader>e", ":NvimTreeToggle<cr>", options) -- file tree
map("n", "<leader>bn", ":bnext<cr>", options) -- next buffer
map("n", "<leader>bp", ":bprev<cr>", options) -- prev buffer
map("n", "L", ":tabn<cr>", options) -- next tab
map("n", "H", ":tabp<cr>", options) -- prev tab
map("n", "<leader>ss", ":CtrlP<cr>", options) -- find files
map("n", "<leader>sb", ":CtrlPBuffer<cr>", options) -- find buffers
map("n", "<leader>fp", ":!npx prettier --write %:p<cr>", options) -- prettier
map("n", "<leader>fb", ":w <bar> !black %:p<cr>", options) -- black
map("n", "<leader>pf", ":w <bar> !flake8 --ignore E501 %:p<cr>", options)
map("n", "<leader>pi", ":lua Pip_install_lib()<cr>", options)
