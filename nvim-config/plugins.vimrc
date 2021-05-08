""" NERDTREE settings
let NERDTreeIgnore=['\~$', '\.pyc$', '^\.DS_Store$', '^node_modules$', '.git', '.ropeproject', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set splitbelow
set splitright

" Close Vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  

"""" AUTOPAIRS settings
" Turn of this plugin ability of handling backspace,
" which caused interference with the ctrl+backspace function in insert mode
let g:AutoPairsMapBS = 0

""" COC settings
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-git']

""" Rainbow Brackets settings
" One Dark Theme settings

set termguicolors
syntax on
colorscheme onedark

" Lightline settings
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
