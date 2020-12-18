set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set foldmethod=syntax
set cursorline
set encoding=utf-8
set showmatch
set sw=4
set ts=4
set nocompatible
set bg=dark
set relativenumber
set noshowmode

set nobackup
set autoindent
set paste
"set expandtab
setlocal spell spelllang=es
filetype plugin on

so ~/.vim/plugins.vim
so ~/.vim/maps.vim
so ~/.vim/plugin-config.vim


"Searching 

set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive
set smartcase     " ... unless they contain at least one capital letter

highlight Normal ctermbg=NONE
set laststatus=2 

let g:coc_global_extensions = ['coc-phpls', 'coc-git', 'coc-actions', 'coc-clangd', 'coc-css', 'coc-java', 'coc-html', 'coc-omnisharp']
 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'csv.vim'

colorscheme goldenrod
