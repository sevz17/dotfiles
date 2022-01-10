-- vi: expandtab ts=2 sw=2

local nvim_lsp = require('lspconfig')

local servers = { 'rls', 'clangd', 'bashls', 'csharp_ls', 'pylsp' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end
