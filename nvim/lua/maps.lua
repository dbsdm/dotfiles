local options = { noremap = true }
local map = vim.api.nvim_set_keymap

--leader
vim.g.mapleader = " "

-------------------------------  MAPS  ---------------------------------------
--insert
map("i", "jk", "<esc>", options) -- jk to enter normal mode
--normal
map("n", "nh", ":nohlsearch<cr>", options) -- no highlight
map("n", "gg", ":1<cr>", options) -- hump to begginig of file
map("n", "<leader>e", ":NvimTreeToggle<cr>", options) -- file tree
map("n", "<leader>bn", ":bnext<cr>", options) -- next buffer
map("n", "<leader>bp", ":bprev<cr>", options) -- prev buffer
map("n", "L", ":tabn<cr>", options) -- next tab
map("n", "H", ":tabp<cr>", options) -- prev tab
map("n", "<leader>s", ":CtrlP<cr>", options) -- find files
map("n", "<leader>tp", ":!npx prettier --write %:p<cr>", options) -- prettier
map("n", "<leader>tb", ":w <bar> !python3 -m black %:p<cr>", options) -- black
map("n", "<leader>tf", ":w <bar> !flake8 --ignore E501 %:p<cr>", options)
