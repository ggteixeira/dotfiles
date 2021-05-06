""" AIRLINE settings
let g:airline_powerline_fonts = 1

let g:airline_section_warning = ''
let g:airline_section_error = ''


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_toggle_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_skip_empty_sections = 1

""" NERDTREE settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" nmap <C-n> :NERDTreeToggle<CR>
" nmap <C-\> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nnoremap <A-S-e> :NERDTreeFocus<CR>
set splitright

" Close Vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  

""" DRACULA settings
colorscheme dracula
syntax on
