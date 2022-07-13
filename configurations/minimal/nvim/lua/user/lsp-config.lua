local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not lspconfig_ok and not cmp_nvim_lsp_ok) then
  return
end

local map = function(combination, command, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', combination, command, bufopts)
end

local on_attach = function(client, bufnr)
  map('gl'         ,vim.diagnostic.open_float                          ,bufnr)
  map('<space>lj'  ,vim.diagnostic.goto_next                           ,bufnr)
  map('<space>lk'  ,vim.diagnostic.goto_prev                           ,bufnr)
  map('gD'         ,vim.lsp.buf.declaration                            ,bufnr)
  map('gd'         ,vim.lsp.buf.definition                             ,bufnr)
  map('gi'         ,vim.lsp.buf.implementation                         ,bufnr)
  map('gr'         ,vim.lsp.buf.references                             ,bufnr)
  map('K'          ,vim.lsp.buf.hover                                  ,bufnr)
  map('<C-k>'      ,vim.lsp.buf.signature_help                         ,bufnr)
  map('<space>lD'  ,vim.lsp.buf.type_definition                        ,bufnr)
  map('<space>lr'  ,vim.lsp.buf.rename                                 ,bufnr)
  map('<space>la'  ,vim.lsp.buf.code_action                            ,bufnr)
  map('<space>lf'  ,vim.lsp.buf.formatting                             ,bufnr)
end

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig['pyright'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['sumneko_lua'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
       },
       diagnostics = {
         globals = {'vim', 'use'},
       },
       workspace = {
         library = vim.api.nvim_get_runtime_file("", true),
       },
       telemetry = {
         enable = false,
       },
     }
  }
}

lspconfig['rust_analyzer'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['bashls'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['clangd'].setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
