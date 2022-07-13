local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {

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
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },

}
