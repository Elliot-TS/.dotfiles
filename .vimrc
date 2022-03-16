" Syntax highlighting
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set expandtab
set shiftwidth=4
set expandtab 
set smartindent
set nu
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set nocompatible
"set cursorline
set relativenumber

" Smart Search
set ignorecase
set smartcase
set incsearch

set tw=0
highlight ColorColumn ctermbg=0 guibg=lightgrey
autocmd Filetype python set cursorcolumn

set scrolloff=10

set mouse=a

" Remap Keys
noremap <C-c> "+y
nnoremap <Leader>y "+y
noremap <C-v> "+p
nnoremap <Leader>p "+p
inoremap jj <esc>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Vim Opacity
nnoremap <Leader>o :hi Normal guibg=NONE ctermbg=NONE<CR>

set spelllang=en_us
inoremap <c-l> <c-g>u<esc>[s1z=`]a<c-g>u
nnoremap <Leader>s :setlocal spell!<CR>

" Lets
let mapleader=" "

" Plugins
call plug#begin('$HOME/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'flazz/vim-colorschemes'
Plug 'lervag/vimtex'
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/CSApprox'
Plug 'fuadnafiz98/transparent.vim'
Plug 'romgrk/doom-one.vim'

call plug#end()
" VimTex
syntax enable
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Autocompile latex on save
autocm BufWritePost *.tex silent !pdflatex --interaction=batchmode "%" 2>&1 > /dev/null
nnoremap <Leader>t :silent !xdg-open "%:t:r".pdf & disown<CR>:redraw!<CR>

colorscheme everforest 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
set background=dark
set t_Co=256

