let mapleader="\<space>"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent><c-s> :<c-u>update<cr> 
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr> 
 
" Use <cr> (Enter/Return) to confirm/accept completion
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Just type ; to enter command mode when in normal mode
nnoremap ; :

" Paste last thing yanked, not the last thing deleted:
nmap ,p "0p

" Append semicolon to the EOL
nnoremap <leader>; A;<esc>

" TABS mappings
nnoremap <leader>h :tabprevious <CR>
nnoremap <leader>l :tabnext <CR>
nnoremap <leader>p :tabnew 

" NERDTREE mappings
nnoremap <A-S-e> :NERDTreeFocus<CR>

" Resizes NERDTree 
" map <silent><leader>l :NERDTreeFocus <CR> :vertical resize +5<cr>
" map <silent><leader>h :NERDTreeFocus <CR> :vertical resize -5<cr>

" Opens NERDTree and keeps the focus in the file
nnoremap <silent><C-\> :call ToggleNerdTree() <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd p <Bar> endif<CR>

" COC Prettier mappings
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Source current file using leader+r
nmap <leader>r :w<CR>:so %<CR>

" Activate FZF using ctrl+p
nnoremap <silent> <expr> <C-P> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

nnoremap <leader><Tab> :Buffers <CR>

" Run prettier
nnoremap <leader>b :Prettier <CR>

" Toggle Nerdcommenter
" For some cryptic reason, Nvim registers ctrl+/ as ctrl+_.
nmap <C-_> <plug>NERDCommenterToggle 

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" Center cursor with scrolloff
nnoremap <leader>c :set scrolloff=999 <CR>
