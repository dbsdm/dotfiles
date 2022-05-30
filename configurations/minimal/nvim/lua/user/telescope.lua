local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous"
      },
      n = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous"
      }
    }
  },
  pickers = {
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
  },
  extensions = {
    -- extension_name = {
    --   extension_config_key = value,
    -- }
  }
}
