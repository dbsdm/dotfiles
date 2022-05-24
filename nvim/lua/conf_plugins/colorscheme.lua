vim.cmd [[
try
      colorscheme zazen
            catch /^Vim\%((\a\+)\)\=:E185/
      colorscheme default
      set background=dark
endtry
]]
