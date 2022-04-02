-- vi: expandtab ts=2 sw=2

local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

vim.g.mapleader = ' ' -- Set <Space> as <Leader>

local options = { noremap = true, silent = true }
local nosilent = { noremap = true, silent = false }

map('n', '<Leader>s', ':HopChar2<CR>', options)
map('n', '<Leader>w', ':w<CR>', options) -- save
map('n', '<Leader>q', ':q<CR>', options) -- quit
map('n', '<Leader>x', ':x<CR>', options) -- save and quit
map('n', '<Leader>+', ':tabe ', nosilent) -- open a tab

map('n', '<Leader>;', '$a;<Esc>', options) -- quick semi

map('n', '<Leader>nt', ':Telescope find_files<CR>', options)
map('n', '<Leader>M', ':Telescope man_pages<CR>', options)
map('n', '<Leader>z', ':Telescope spell_suggest<CR>', options)
map('n', '<Leader>b', ':Telescope builtin<CR>', options)
map('n', '<Leader>t', ':Telescope treesitter<CR>', options)

map('n', '<Leader>kp', ':let @*=expand("%")<CR>', options)

map('', '<Leader>h', ':tabprevious<CR>', options)
map('', '<Leader>l', ':tabnext<CR>', options)

map('n', '<Leader>ob', ':Telescope buffers<CR>', options)

map('n', '<Leader>gd', ':Telescope lsp_definitions<CR>', options)
map('n', '<Leader>gi', ':Telescope lsp_implementations<CR>', options)
map('n', '<Leader>gt', ':Telescope lsp_type_definitions<CR>', options)
map('n', '<Leader>gr', ':Telescope lsp_references<CR>', options)
