local options = { noremap = true }
local map = vim.api.nvim_set_keymap

--leader
vim.g.mapleader = " "

vim.cmd [[ 
  function! SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc
]]

-------------------------------  MAPS  ---------------------------------------
--insert
map("i", "jk", "<esc>", options) -- jk to enter normal mode
--normal
map("n", "gg", ":1<cr>", options) -- hump to begginig of file
map("n", "L", ":tabn<cr>", options) -- next tab
map("n", "H", ":tabp<cr>", options) -- prev tab
map("n", "<F10>", ":call SynStack()<cr>", options)
map("n", "<F11>", [[ :%s/\s\+$//e<cr> ]], options)
