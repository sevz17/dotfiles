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
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set nocompatible
set relativenumber
set noshowmode
set nobackup
set autoindent
set paste
"set expandtab
setlocal spell spelllang=es
filetype plugin on

source ~/.vim/plugins.vim
source ~/.vim/maps.vim
source ~/.vim/plugin-config.vim

"Searching 

set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive
set smartcase     " ... unless they contain at least one capital letter

highlight Normal ctermbg=NONE
set laststatus=2 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'csv.vim'

colorscheme goldenrod
hi Normal guibg=NONE ctermbg=NONE
