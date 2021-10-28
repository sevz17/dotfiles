-- vi: expandtab ts=2 sw=2

local nvim_lsp = require('lspconfig')
local configs = require'lspconfig/configs'

-- Check if it's already defined for when reloading this file.
if not nvim_lsp.lua_lsp then
  configs.lua_lsp = {
    default_config = {
      cmd = {'/usr/share/lua/5.1/bin/lua-lsp'};
      filetypes = {'lua'};
      root_dir = function(fname)
        return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      settings = {};
    };
  }
end

local servers = { 'rls', 'clangd', 'bashls', 'csharp_ls', 'lua_lsp', 'pylsp' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
  }
end
