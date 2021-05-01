" My Vimrc
" URL: https://github.com/guiemi/mac-dotfiles/blob/master/.vimrc
" Author: Guilherme Teixeira
" Description: My personal VIMRC, built along the years in order to fulfill my
" needs. 

" =====================================================
" FEATURES
" =====================================================

" Avoid unexpected things that the OS may have made:
set nocompatible

filetype indent plugin on

syntax on " Syntax highlighting

set clipboard=unnamed " Copy to clipboard

set linebreak

"" =====================================================
" MUST HAVE options 
" =====================================================

set hidden " Managing multiple instances of Vim

set showcmd " Show partial commands in the last line of the screen

set hlsearch " Highlight searches

set incsearch " Highlight search when entering a pattern

set noerrorbells " Disable error bells if you reach the end of the line


" =====================================================
" USABILITY options
" =====================================================

set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action

set autoindent " Keeps the same indent as the line you're currently on

set ruler " Display the cursor position on the last line of the screen or in the status line of a window

set ignorecase " Use case insensitive search, execpt when using capital letters

set smartcase " set smartcase

set nostartofline " Stop certain movements from always going to the first character of a line.

set laststatus=2 " Always display the status line, even if only one window is displayed

set confirm " Raise a dialogue asking if you wish to save changed files.

set mouse=a " Enable use of mouse for all modes

set number " Show line numbers
set relativenumber " Show line numbers relatively 

set cursorline " Cursor customizations
hi CursorLineNR cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white

set noswapfile " Disables creating swap files

set colorcolumn=79 " Column limit
hi ColorColumn ctermbg=darkgrey guibg=green

" =====================================================
" INDENTATION options
" =====================================================

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab

" =====================================================
" OTHER options
" =====================================================
set t_Co=256
set showmatch
set enc=utf-8

set wildmenu " Better command-line completion

" =====================================================
" MAPPINGS
" C => Control | S => Shift
" =====================================================

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <S-Tab> << 
inoremap <S-Tab> <C-d>
" inoremap <C-Backspace> <echo TESTE><jj><ESC-jj> 

autocmd FileType python map <buffer> <F8> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


"" =====================================================
" VUNDLE plugins
" =====================================================

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize

call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " plugin manager
Plugin 'jiangmiao/auto-pairs' " Autopair
Plugin 'dense-analysis/ale' " Linter (ALE)
Plugin 'vim-airline/vim-airline' " Status bar on bottom (Powerline/Airline)
Plugin 'vim-airline/vim-airline-themes' " Airline themes
Plugin 'preservim/nerdtree'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-python/python-syntax'
" Plugin 'davidhalter/jedi-vim' " Autocomplete (Jedi)

call vundle#end()


" =====================================================
" THEMES 
" =====================================================

" =====================================================
" VUNDLE settings
" =====================================================
""" Airline settings
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_toggle_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_skip_empty_sections = 1

""" NERDTree settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " Close Vim if only NerdTree is open

""" Color scheme settings
set termguicolors
colorscheme nord

""" Python syntax settings
let g:python_highlight_all = 1 
let g:python_highlight_string_formatting = 1
let g:Python3Syntax = 1
let g:pymode_python = 'python3'


""" Vim Airline settings
set guifont=Hack:h30 " Set font
let g:Powerline_symbols = 'fancy'  " Powerline Symbols
set encoding=utf-8  " Set encoding
set fillchars+=stl:\ ,stlnc:\
" set cterm=xterm-256color
set termencoding=utf-8

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Inconsolata-dz\ for\ Powerline:h15
    endif
endif

""" Virtualenv settings
" if has('python')
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF
" endif

""" Neovim (nvim) compatibility:
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

