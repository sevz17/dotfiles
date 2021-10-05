local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

vim.g.mapleader = ' ' -- Set <Space> as <Leader>

local options = { noremap = true, silent = true }

map('n', '<Leader>s', '<Plug>(easymotion-s2)', options) -- open easymotion
map('n', '<Leader>w', ':w<CR>', options) -- save
map('n', '<Leader>q', ':q<CR>', options) -- quit
map('n', '<Leader>x', ':x<CR>', options) -- save and quit
map('n', '<Leader>+', ':tabe', options) -- open a tab

map('n', '<Leader>;', '$a;<Esc>', options) -- quick semi

cmd('cnoreabbrev tree NERDTreeToggle')
cmd('cnoreabbrev blame Gblame')
cmd('cnoreabbrev find NERDTreeFind')
cmd('cnoreabbrev diff Gdiff')

map('', '<Leader>nt', ':NERDTreeFind<CR>', {})
map('', '<Leader>p', ':Files<CR>', {})
map('', '<Leader>ag', ':Ag<CR>', {})

map('n', '<Leader>kp', ':let @*=expand("%")<CR>', options)

map('', '<Leader>h', ':tabprevious<CR>', options)
map('', '<Leader>l', ':tabnext<CR>', options)

map('', '<Leader>ob', ':Buffers<CR>', options)
