set t_Co=256
set showmatch
set enc=utf-8

" Better command-line completion
set wildmenu 

" Enables rescan when highlighting JS, JSX, TS, and TSX files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

