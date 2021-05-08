" n -> normalmode
" nore -> not recursion
" map -> map

let mapleader="\<space>"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent><c-s> :<c-u>update<cr> 
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr> 
 
" Use <cr> (Enter/Return) to confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Just type ; to enter command mode when in normal mode
nnoremap ; :

" Paste last thing yanked, not the last thing deleted:
nmap ,p "0p

" Append semicolon to the EOL
nnoremap <leader>; A;<esc>

" NERDTREE mappings
" nmap <C-n> :NERDTreeToggle<CR>
nmap <C-\> :NERDTreeToggle<CR>
nnoremap <A-S-e> :NERDTreeFocus<CR>

" COC Prettier mappings
command! -nargs=0 Prettier :CocCommand prettier.formatFile
