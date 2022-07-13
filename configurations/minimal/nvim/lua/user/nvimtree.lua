local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvimtree.setup {
  sort_by = "name",
  hijack_cursor = true,
  respect_buf_cwd = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  view = {
    side = "left",
    adaptive_size = true,
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      glyphs = {
        git = {
          unstaged = "M",
          staged = "S",
          renamed = "R",
          untracked = "U",
          deleted = "D",
          ignored = "I",
        },
      }
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "H",
      info = "I",
      warning = "W",
      error = "E",
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
