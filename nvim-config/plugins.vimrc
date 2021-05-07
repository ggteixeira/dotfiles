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
let NERDTreeIgnore=['\~$', '\.pyc$', '^\.DS_Store$', '^node_modules$', '.git', '.ropeproject', '__pycache__']
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

"""" AUTOPAIRS settings
" Turn of this plugin ability of handling backspace,
" which caused interference with the ctrl+backspace function in insert mode
let g:AutoPairsMapBS = 0

""" COC settings
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
