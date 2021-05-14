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
      \'coc-emmet',
      \'coc-pairs'
\]

" One Dark Theme settings

set termguicolors
syntax on
colorscheme onedark

" Lightline settings
set noshowmode
let g:lightline = {
\  'colorscheme': 'onedark',
\  'active': {
\    'left': [ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\  },
\   'component_function': {
\   'gitbranch': 'gitbranch#name'
\  },
\  }


" Sets The Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:Ag = 'ag --nogroup --nocolor --column'

" NERDCommenter settings
let g:NERDSpaceDelims = 1

" FZF settings
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_layout = {'down': '40%'}
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
  " \ 'bg':      ['bg', 'Normal'],
  " \ 'hl':      ['fg', 'Comment'],
  " \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  " \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  " \ 'hl+':     ['fg', 'Statement'],
  " \ 'info':    ['fg', 'PreProc'],
  " \ 'border':  ['fg', 'Ignore'],
  " \ 'prompt':  ['fg', 'Conditional'],
  " \ 'pointer': ['fg', 'Exception'],
  " \ 'marker':  ['fg', 'Keyword'],
  " \ 'spinner': ['fg', 'Label'],
  " \ 'header':  ['fg', 'Comment'] }
