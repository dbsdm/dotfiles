require('telescope').setup{
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
