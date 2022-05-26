require'nvim-treesitter.configs'.setup {

  ensure_installed = {
    "python",
    "html",
    "css",
    "scss",
    "javascript",
    "dockerfile",
    "bash",
    "fish",
    "lua",
    "tsx",
    "typescript",
    "yaml",
    "rust",
  },

  sync_install = true,

  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = {},
    additional_vim_regex_highlighting = false,
  },

}
