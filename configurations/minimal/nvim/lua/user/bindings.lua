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
map("n", "gg", ":1<cr>", options) -- hump to begginig of file
map("n", "L", ":tabn<cr>", options) -- next tab
map("n", "H", ":tabp<cr>", options) -- prev tab
