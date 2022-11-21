" Vim Cheet Sheet https://vim.rtorr.com/
syntax on
set timeoutlen=200
set linebreak
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
set foldmethod=syntax

" Smart Search
set ignorecase
set smartcase
set incsearch

set tw=0
highlight ColorColumn ctermbg=0 guibg=lightgrey
autocmd Filetype python set cursorcolumn

set scrolloff=10

"set mouse=a
" Remap Keys
let mapleader=" "
nnoremap <leader>y "+y
nnoremap <leader>p "+p
inoremap jj <esc>
nnoremap <A-LEFT> :wincmd h<CR>
nnoremap <A-DOWN> :wincmd j<CR>
nnoremap <A-UP> :wincmd k<CR>
nnoremap <A-RIGHT> :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" Vim Opacity
nnoremap <leader>o :hi Normal guibg=NONE ctermbg=NONE<CR>

" Spelling
set spelllang=en_us
inoremap <c-l> <c-g>u<esc>[s1z=`]a<c-g>u
nnoremap <leader>s :setlocal spell!<CR>

" Custom Commands
nnoremap <leader>g :!/home/elliots/.dotfiles/.vim/utils/latex/Gauss_Elim<CR>
:command W w
:command WQ wq
:command Wq wq

" Latex Colors
nnoremap <leader>co bvec\c{}<esc>Pl%i
vnoremap <leader>co c\c{}<esc>Pl%i

" PShift lugins
call plug#begin('$HOME/.vim/plugged')

Plug 'morhetz/gruvbox'
"Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'flazz/vim-colorschemes'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sainnhe/everforest' 
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/CSApprox'
"Plug 'fuadnafiz98/transparent.vim'
Plug 'romgrk/doom-one.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'beyondmarc/glsl.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'hardselius/warlock'
Plug 'pgdouyon/vim-yin-yang'
Plug 'puremourning/vimspector'
Plug 'Townk/vim-autoclose'
Plug 'rustushki/JavaImp.vim'

call plug#end()

"JavaImp
let g:JavaImpPaths = "/home/elliots/Documents/Elliot Swaim/Education/2022-2023 (Sophomore)/CSC-207/Assignments/AccessibilityTestAnalysis,/home/elliots/Documents/Elliot Swaim/Education/2021-2022 (Freshman)/Summer MAP/WSU_KSuite_1.1.2/WSU_KSuite_1.1.2/classes"
let g:JavaImpTopImports = [
	\ 'java\..*',
	\ 'javax\..*',
	\ 'org\..*',
	\ 'com\..*'
	\ ]

" VimTex
syntax enable
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Autocompile latex on save
autocm BufWritePost *.tex silent !xelatex --interaction=batchmode "%" 2>&1 > /dev/null
nnoremap <leader>t :silent !zathura "%:t:r".pdf & disown<CR>:redraw!<CR>

" Snippets
let g:UltiSnipsSnippetDirectries = ['$HOME/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = '<C-s>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Template Files
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.tex 0r $HOME/.vim/templates/skeleton.tex
        autocmd BufNewFile *.c 0r $HOME/.vim/templates/skeleton.c
        autocmd BufNewFile *.sh 0r $HOME/.vim/templates/skeleton.sh
    augroup END
endif

" Theming
colorscheme everforest 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
set background=dark
set t_Co=256

" Javalmp


" YouCompleteMe
"let g:ycm_filetype_whitelist = {"tex":1}

" Coc
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <TAB> auto-select the first completion item 
" Enter for auto-select
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" (Except without the backslash before the quotes, obviously
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Vimspector
" Visual Studio Mappings:
" - F5: <Plug>VimspectorContinue
" - Shift F5: <Plug>VimspectorStop
" - Ctrl Shift F5: <Plug>VimspectorRestart
" - F6: <Plug>VimspectortPause
" - F8: <Plug>VimspectorJumpToNextBreakpoint
" - Shift F8: <Plug>VimspectorJumpToPreviousBreakpoint
" - F9: <Plug>VimspectorStepOver
" - F11: <Plug>VimspectorStepInto
" - Shift F11: <Plug>VimspectorStepOut
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Human Mode Mappings:
" - F5: <Plug>VimspectorContinue
" - F3: <Plug>VimspectorStop
" - F4: <Plug>VimspectorRestart
" - F6: <Plug>VimspectorPause
" - F9: <Plug>VimspectorJumpToNextBreakpoint
" - <leader>F9: <Plug>VimspectorJumpToPreviousBreakpoint
" - F8: <Plug>VimspectorAddFunctionBreakpoint
" - <leader>F8: <Plug>VimspectorRunToCursor
" - F10: <Plug>VimspectorStepOver
" - F11: <Plug>VimspectorStepInto
" - F12: <Plug>VimspectorStepOut
let g:vimspector_enable_mappings = 'HUMAN'

nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval

" Moving up/down the stack
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

