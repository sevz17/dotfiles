local set = vim.o
local gset = vim.g
local cmd = vim.cmd
local vexec = vim.fn

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

gset.NERDTreeShowHidden = true
gset.NERDTreeQuitOnOpen = true
gset.NERDTreeAutoDeleteBuffer = true
gset.NERDTreeMinimalUI = true
gset.NERDTreeDirArrows = true
gset.NERDTreeShowLineNumbers = true
gset.NERDTreeMapOpenInTab = '\t'

gset.UltiSnipsExpandTrigger = '<c><tab>'
gset.UltiSnipsJumpForwardTrigger = '<c-b>'
gset.UltiSnipsJumpBackwardTrigger = '<c-z>'

cmd('autocmd FileType scss setl iskeyword+=@-@')

--gset.coc_global_extensions = ']
--

options.expr = true

map('i', '<C-space>', 'coc#refresh()', options)

options.expr = nil

cmd('source ~/.config/nvim/coc-config.vim')

map('n', 'gd', '<Plug>(coc-definition)', options)
map('n', 'gy', '<Plug>(coc-type-definition)', options)
map('n', 'gi', '<Plug>(coc-implementation)', options)
map('n', 'gr', '<Plug>(coc-references)', options)

cmd('autocmd CursorHold * silent call CocActionAsync(\'highlight\')')
cmd('autocmd BufReadPost *.rs setlocal filetype=rust')

gset.LanguageClient_autoStart = true

map('n', '<Leader>K', ':call LanguageClient_textDocument_hover()<CR>', options)
map('n', 'gd', ':call LanguageClient_textDocument_definition()<CR>', options)
map('n', '<F2>', ':call LanguageClient_textDocument_rename()<CR>', options)
