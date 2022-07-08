vim.cmd [[
try
      colorscheme jet
            catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme default
      set background=dark
endtry
]]
