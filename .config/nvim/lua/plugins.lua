return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Packer can manage itself

	use 'sheerun/vim-polyglot' -- Syntax

	use 'flazz/vim-colorschemes' -- Themes

	use 'jiangmiao/auto-pairs' -- Typing

	-- IDE
	use 'preservim/nerdcommenter'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use {
		'phaazon/hop.nvim',
		as = 'hop'
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}

	use 'kyazdani42/nvim-web-devicons'

	use 'lambdalisue/suda.vim' -- If forgot open with permisions

	-- Collection of common configurations for the Nvim LSP client
	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
