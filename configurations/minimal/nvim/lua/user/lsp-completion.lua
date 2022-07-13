local cmp_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")
local lspkind_ok, lspkind = pcall(require, "lspkind")
if ( not ( cmp_ok and luasnip_ok and lspkind_ok ) ) then
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-f>'] = cmp.mapping.scroll_docs(2),
    ['<C-d>'] = cmp.mapping.scroll_docs(-2),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'nvim_lua'},
    { name = 'buffer'},
    { name = 'path'},
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = ({
        nvim_lua = "[Lua]",
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        cmp_tabnine = "[Tabnine]",
        latex_symbols = "[Latex]",
      })
    }),
  }
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

local cmp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local handlers_ok, handlers = pcall(require, "nvim-autopairs.completion.handlers")
if ( not ( cmp_autopairs_ok and handlers_ok ) ) then
  return
end

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
    }
  })
)

