call plug#begin('~/.vim/plugged')
Plug 'https://github.com/w0rp/ale.git'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
call plug#end()

" syntax on
" filetype indent plugin on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set mouse-=a
set background=dark
set number
" set linebreak
" set nowrap
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set list

" ALE
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_completion_enabled = 1

" NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Airline 
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:powerline_pycmd = "py3" 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" VimTex
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_complete_recursive_bib = 1

set t_Co=256
