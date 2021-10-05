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

	use { 'neoclide/coc.nvim', branch = 'release' }

	-- IDE
	use 'easymotion/vim-easymotion'
	use 'preservim/nerdcommenter'
	use 'scrooloose/nerdtree'
	use 'junegunn/fzf.vim'

	use 'lambdalisue/suda.vim' -- If forgot open with permisions

	-- Collection of common configurations for the Nvim LSP client
	use 'neovim/nvim-lspconfig'

	-- Extensions to built-in LSP, for example, providing type inlay hints
	use 'nvim-lua/lsp_extensions.nvim'

	-- Autocompletion framework for built-in LSP
	use 'nvim-lua/completion-nvim'

	use { 'autozimu/LanguageClient-neovim', run = ':UpdateRemotePlugins' }


end)
