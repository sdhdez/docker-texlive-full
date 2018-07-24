highlight ColorColumn ctermbg=gray
set colorcolumn=90
set spelllang=en_us
autocmd BufEnter,BufRead,BufNewFile *.tex setlocal spell
autocmd BufEnter,BufRead,BufNewFile *.bib setlocal nospell
let g:syntastic_quiet_messages = {"regex":   ['Vertical rules in tables are ugly']}
