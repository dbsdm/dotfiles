local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["b"] = { "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", "Buffers" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = { "<cmd>Telescope find_files theme=dropdown previewer=false<cr>", "Find Text" },
  ["F"] = { "<cmd>Telescope live_grep theme=dropdown<cr>", "Live Grep" },
  ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status theme=dropdown<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches theme=dropdown<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits theme=dropdown<cr>", "Checkout commit" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=dropdown<cr>","Document Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols theme=dropdown<cr>", "Document Symbols" },
    S = {
        "<cmd>Telescope lsp_dynamic_workspace_symbols theme=dropdown<cr>",
        "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches theme=dropdown<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme theme=dropdown<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags theme=dropdown<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages theme=dropdown<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles theme=dropdown previewer=false<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers theme=dropdown previewer=false<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps theme=dropdown<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands theme=dropdown<cr>", "Commands" },
  },
  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  u = {
    name = "Utils",
    b = { "<cmd>w <bar> !python3 -m black %:p<cr>", "Save & format with Black" },
    c = { "<cmd>w <bar> !cargo fmt<cr>", "Save & format with Cargo fmt" },
    f = { "<cmd>w <bar> !flake8 --ignore E501 %:p<cr>", "Save & run Flake8" },
    p = { "<cmd>w <bar> !npx prettier --write --tab-width 4 %<cr>", "Save & run Prettier" },
    o = { "<cmd>PyrightOrganizeImports<cr>", "Pyright Organize Imports" },
  },
  r = {
    name = "Run",
    p = { "<cmd>w <bar> TermExec cmd='python3 %'<cr>", "Run with Python3" },
    c = { "<cmd>w <bar> TermExec cmd='cargo run'<cr>", "Build and run with Cargo" }
  },
  z = { ":ZenMode<cr>", "Zen Mode" }
}

which_key.setup(setup)
which_key.register(mappings, opts)
