local set = vim.o
local gset = vim.g
local cmd = vim.cmd
local vexec = vim.fn
local luasnip = require('luasnip')
local cmp = require('cmp')
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

cmd('autocmd FileType scss setl iskeyword+=@-@')
cmd('autocmd BufReadPost *.rs setlocal filetype=rust')

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = function(core, fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
			elseif not check_back_space() then
				cmp.mapping.complete()(core, fallback)
			else
				vim.cmd(':>')
			end
		end,
		['<S-Tab>'] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
			else
				vim.cmd(':<')
			end
		end,
		},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

require'hop'.setup { keys = 'aoeuidrtnszvwmb-qjk', set_seq_bias = 0.5 }

local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		mappings = {
			i = { ['<ESC>'] = actions.close },
		},
		layout_config = {
			horizontal = {
				width = 0.9,
				preview_width = 0.6,
			}
		},
	}
})
