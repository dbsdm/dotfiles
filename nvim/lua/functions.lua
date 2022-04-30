-- install python lib under cursor
function Pip_install_lib()
    vim.cmd [[!pip3 install <cword>]]
    vim.cmd [[echo 'INSTALLATION FINISHED RESTART LSP SERVER']]
end
