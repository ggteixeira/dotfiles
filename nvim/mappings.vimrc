let mapleader="\<space>"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent><c-s> :<c-u>update<cr> 
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr> 
 
" Just type ; to enter command mode when in normal mode
nnoremap ; :
vnoremap ; :

" Paste last thing yanked, not the last thing deleted:
nmap ,p "0p

" Append semicolon to the EOL
" nnoremap <leader>; A;<esc>

" TABS mappings
nnoremap <leader>h :tabprevious <CR>
nnoremap <leader>l :tabnext <CR>
nnoremap <leader>n :tabnew<CR>

" move current tab to left/right
noremap <Leader><Left>  :tabmove -1<CR>
noremap <Leader><Right> :tabmove +1<CR>

" NERDTREE mappings
nnoremap <A-S-e> :NERDTreeFocus<CR>

" Resizes NERDTree 
" map <silent><leader>l :NERDTreeFocus <CR> :vertical resize +5<cr>
" map <silent><leader>h :NERDTreeFocus <CR> :vertical resize -5<cr>

" Opens NERDTree and keeps the focus in the file
nnoremap <silent><C-\> :call ToggleNerdTree() <Bar> if &filetype ==# 'nerdtree' <Bar> wincmd p <Bar> endif<CR>

" Source current file using leader+r
nmap <leader>r :w<CR>:so %<CR>

" Activate FZF using ctrl+p
nnoremap <silent> <expr> <C-P> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"
nnoremap <silent> <C-g> :Rg!<CR>
nnoremap <silent> <leader>p :Files<CR>

nnoremap <leader><Tab> :Buffers <CR>

" Run prettier
nnoremap <leader>b :Prettier <CR>

" Toggle Nerdcommenter
" For some cryptic reason, Nvim registers ctrl+/ as ctrl+_.
nmap <C-_> <plug>NERDCommenterToggle 
vmap <C-_> <plug>NERDCommenterSexy

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" Center cursor with scrolloff
nnoremap <leader>cc :set scrolloff=999 <CR>
 
" Source Vim config file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Clear search afterwards
map <silent><esc> :noh <CR>


""" COC mappings
" Use <cr> (Enter/Return) to confirm/accept completion
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" COC Prettier mappings
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to type definition
nmap <silent> gy <Plug>(coc-type-definition)
" go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" go to references
nmap <silent> gr <Plug>(coc-references)
" run code lens on current line
nmap <leader>bl <Plug>(coc-codelens-action)
" rename symbol
nmap <leader>rs  <Plug>(coc-rename)

" COC git 
nmap gs <Plug>(coc-git-chunkinfo)
