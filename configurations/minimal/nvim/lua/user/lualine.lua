local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = '16color',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'filename',
        symbols = {
          modified = "[+]",
          readonly = "[RO]",
          unnamed = "[New File]",
        }
      },
    },
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {
        'encoding',
        {'fileformat',
          symbols = {
            unix = "unix",
            dos = "dos",
            mac = "mac",
          }
        },
        {'filetype',
          colored = true,
        }
    },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    "nvim-dap-ui",
    "symbols-outline",
    "quickfix",
  }
}
