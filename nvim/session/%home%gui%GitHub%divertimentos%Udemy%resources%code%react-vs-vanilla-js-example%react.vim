let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +8 ~/GitHub/divertimentos/Udemy/curso-udemy-react-the-complete-guide/react-vs-vanilla-js-example/just-js/style.css
badd +1 src/App.js
badd +1 ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/index.js
badd +0 ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Backdrop.js
badd +0 ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js
badd +0 ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Todo.js
argglobal
%argdel
edit src/App.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
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
balt ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Backdrop.js
let s:l = 5 - ((4 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Backdrop.js", ":p")) | buffer ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Backdrop.js | else | edit ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Backdrop.js | endif
if &buftype ==# 'terminal'
  silent file ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Backdrop.js
endif
balt ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js
let s:l = 1 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js", ":p")) | buffer ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js | else | edit ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js | endif
if &buftype ==# 'terminal'
  silent file ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js
endif
balt ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Todo.js
let s:l = 1 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Todo.js", ":p")) | buffer ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Todo.js | else | edit ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Todo.js | endif
if &buftype ==# 'terminal'
  silent file ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Todo.js
endif
balt ~/GitHub/divertimentos/Udemy/resources/code/react-vs-vanilla-js-example/react/src/components/Modal.js
let s:l = 1 - ((0 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
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
