" ------------------------------------------------------------------------------
" # Plugin Definitions
" ------------------------------------------------------------------------------

Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'yuezk/vim-js'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'michaeldyrynda/carbon'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'


" Plug 'gko/vim-coloresque'
" Plug 'dylanaraps/wal.vim'

" ------------------------------------------------------------------------------
" # Plugin Configs 
" ------------------------------------------------------------------------------

""" NERDTree
let NERDTreeIgnore=[
      \'\~$', '\.pyc$', 
      \'^\.DS_Store$', 
      \'^node_modules$', 
      \'.git', 
      \'.ropeproject', 
      \'__pycache__'
\]
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Exit Vim if NERDTree is the only window left open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if, and only if, NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction

" Turn of this plugin ability of handling backspace,
" which caused interference with the ctrl+backspace function in insert mode
let g:AutoPairsMapBS = 0

""" COC 
let g:coc_global_extensions = [
      \'coc-css', 
      \'coc-html', 
      \'coc-json', 
      \'coc-prettier', 
      \'coc-git',
      \'coc-eslint',
      \'coc-styled-components',
      \'coc-pairs',
\]

""" Lightline 
let g:lightline = {
\  'colorscheme': 'one',
\  'active': {
\    'left': [ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\  },
\   'component_function': {
\   'gitbranch': 'gitbranch#name'
\  },
\  }

""" NERDCommenter 
let g:NERDSpaceDelims = 1

""" FZF 
let g:fzf_preview_window = ['right:40%', 'ctrl-/']

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

let g:fzf_layout = {'down': '50%'}
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

""" Closetag 
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

""" Indent Blankline
let g:indent_blankline_filetype_exclude = ['startify', 'nerdtree', 'help']

