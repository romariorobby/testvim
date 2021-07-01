syntax on
set clipboard+=unnamedplus
set smartindent
set shiftwidth=4 
set tabstop=4 softtabstop=4
set nobackup
set undodir=~/.local/share/nvim/undodir
" set guifont
set undofile
set nowrap
set noswapfile
set nowritebackup
set incsearch
set nu rnu
set termguicolors
set noshowmode
set splitbelow splitright
set hidden
set colorcolumn=80
set title
set mouse=a
set scrolloff=10
set nocompatible
set updatetime=300
set shortmess+=c
set autochdir
if &diff
    highlight! link DiffText MatchParen
endif
" Colorscheme
colorscheme romario
let g:coloraqs=256
