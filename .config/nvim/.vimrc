set statusline+=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set statusline+=\{…\}%3{codeium#GetStatusString()}
set clipboard=unnamedplus

let g:flog_permanent_default_opts = {
            \ 'max_count': 300,
            \ 'date': 'short',
            \ }



