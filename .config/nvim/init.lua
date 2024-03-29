-- vi: expandtab ts=2 sw=2

local set = vim.o
local cmd = vim.cmd
local show_errors = true

set.number = true
set.hidden = true
set.mouse = 'a'
set.numberwidth = 1
set.syntax = 'enable'
set.showcmd = true
set.ruler = true
set.cursorline = true
set.encoding = 'utf-8'
set.showmatch = true
set.shiftwidth = 4
set.tabstop = 4
set.autoindent = true
set.smartindent = true
set.autoread = true
set.fsync = true
set.compatible = false
set.relativenumber = true
set.showmode = false
set.backup = false
set.writebackup = false
set.autoindent = true

set.updatetime = 100

vim.opt.shortmess:append('c') -- Don't give |ins-completion-menu| messages.
vim.signcolumn = true
vim.opt.diffopt:append('vertical')

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
set.completeopt = 'menuone,noinsert,noselect'

cmd('setlocal spell spelllang=en')
cmd('filetype plugin on')
cmd('filetype indent on')

local function tryload(module)
  local has_mod,mod = pcall(require,module)
  if has_mod then
    return mod
  elseif show_errors then
    print(mod)
  end

  return nil
end

local plugins = tryload('plugins')
tryload('maps')
tryload('plugin-config')
tryload('lsp-servers')
tryload('statusline')

set.hlsearch   = true  -- Highlight matches
set.incsearch  = true  -- Incremental searching
set.ignorecase = true  -- Searches are case insensitive
set.smartcase  = true  -- ... unless they contain at least one capital letter

set.laststatus = 2

set.background = 'dark'
if plugins then
  cmd('silent! colorscheme gruvbox')
else
  cmd('colorscheme darkblue')
end
