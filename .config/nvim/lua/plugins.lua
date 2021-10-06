return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Packer can manage itself

	use 'sheerun/vim-polyglot' -- Syntax

	-- Status Bar
	--use 'maximbaz/lightline-ale'
	--use 'itchyny/lightline.vim'

	-- Themes
	use 'flazz/vim-colorschemes'
--	use 'vim-airline/vim-airline'

	use 'jiangmiao/auto-pairs' -- Typing

	-- IDE
	use 'easymotion/vim-easymotion'
	use 'preservim/nerdcommenter'
	use 'scrooloose/nerdtree'
	use 'junegunn/fzf.vim'

	use 'lambdalisue/suda.vim' -- If forgot open with permisions

	-- Collection of common configurations for the Nvim LSP client
	use 'neovim/nvim-lspconfig'

	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
