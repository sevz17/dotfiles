call plug#begin('~/.vim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'

" typing
Plug 'jiangmiao/auto-pairs'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'

" If forgot open with permisions
Plug 'lambdalisue/suda.vim'

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
