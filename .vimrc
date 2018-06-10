set nocompatible              " be iMproved, required
filetype off                  " required

set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable                               " syntax highlight
set t_Co=256                                " set 256 colors
colorscheme atom-dark-256                   " set color scheme
set showmatch                               " shows matching part of bracket pairs (), [], {}
set enc=utf-8	                            " utf-8 by default
set hlsearch
set syntax=python
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ==== plugin manager
Plugin 'VundleVim/Vundle.vim'

" Autopair

Plugin 'jiangmiao/auto-pairs'

" ==== File Tree
Plugin 'scrooloose/nerdtree'

" ==== Syntax Helpers
Plugin 'scrooloose/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ==== snippets

" ==== Status bar on bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" let g:airline_solarized_bg='dark'
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" lints
let g:pymode_lint=0




" ==== * ==== Python ==== * ==== * ====
Plugin 'klen/python-mode'

" Python-Syntax
Plugin 'vim-python/python-syntax'

let g:python_highlight_all = 1 
let g:python_highlight_string_formatting = 1
let g:Python3Syntax = 1


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =====================================================
"" General settings
" =====================================================

"""""""""""" Start Powerline Settings """"""""""""""""

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15
        colorscheme PaperColor              " set color scheme
    endif
endif

""""""""""" END of PowerLine Settings  """""""""""""""

"=====================================================
"" nerdtree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" # autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap <C-h> :NERDTreeToggle<CR>
map <C-\> :NERDTreeToggle<CR>

" Atalhos personalizados

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
