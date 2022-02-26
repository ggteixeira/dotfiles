" teste dois
Plug 'preservim/nerdtree', {'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'gko/vim-coloresque'
Plug 'ryanoasis/vim-devicons'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'dylanaraps/wal.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'alvan/vim-closetag'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'michaeldyrynda/carbon'
Plug 'sheerun/vim-polyglot'

""" NERDTREE settings
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
set splitbelow
set splitright

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" returns true iff is NERDTree open/active

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
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

"nmap <si\ent><C-\> :NERDTreeToggle<CR>

" Turn of this plugin ability of handling backspace,
" which caused interference with the ctrl+backspace function in insert mode
let g:AutoPairsMapBS = 0

""" COC settings
let g:coc_global_extensions = [
      \'coc-tslint-plugin', 
      \'coc-tsserver', 
      \'coc-css', 
      \'coc-html', 
      \'coc-json', 
      \'coc-prettier', 
      \'coc-git',
      \'coc-eslint',
      \'coc-styled-components',
      \'coc-pairs',
      \'coc-emmet'
\]


" Lightline settings
set noshowmode
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


" sets the silver searcher
" let g:ackprg = 'ag --nogroup --nocolor --column'
" let g:ag = 'ag --nogroup --nocolor --column'

" NERDCommenter settings
let g:NERDSpaceDelims = 1

" FZF settings
let g:fzf_preview_window = ['right:40%', 'ctrl-/']

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_layout = {'down': '50%'}
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" Closetag Settings

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'

" Indent Blankline
let g:indent_blankline_filetype_exclude = ['startify', 'nerdtree', 'help']


