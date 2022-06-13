let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/GitHub/divertimentos/Udemy/curso-udemy-react-the-complete-guide
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +1 ~/GitHub/divertimentos/Udemy/react-complete-guide-code/README.md
badd +1 react-vs-vanilla-js-example/just-js/app.js
badd +18 react-vs-vanilla-js-example/just-js/index.html
badd +8 react-vs-vanilla-js-example/just-js/styles.css
argglobal
%argdel
edit react-vs-vanilla-js-example/just-js/index.html
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt react-vs-vanilla-js-example/just-js/styles.css
let s:l = 17 - ((16 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 025|
wincmd w
argglobal
if bufexists(fnamemodify("react-vs-vanilla-js-example/just-js/styles.css", ":p")) | buffer react-vs-vanilla-js-example/just-js/styles.css | else | edit react-vs-vanilla-js-example/just-js/styles.css | endif
if &buftype ==# 'terminal'
  silent file react-vs-vanilla-js-example/just-js/styles.css
endif
balt react-vs-vanilla-js-example/just-js/index.html
let s:l = 18 - ((17 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("react-vs-vanilla-js-example/just-js/app.js", ":p")) | buffer react-vs-vanilla-js-example/just-js/app.js | else | edit react-vs-vanilla-js-example/just-js/app.js | endif
if &buftype ==# 'terminal'
  silent file react-vs-vanilla-js-example/just-js/app.js
endif
balt react-vs-vanilla-js-example/just-js/index.html
let s:l = 11 - ((10 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 0
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
