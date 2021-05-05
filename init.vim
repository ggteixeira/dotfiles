"
" My NEOVIM configs
" URL: https://github.com/vibraniumdev/macOS-Dotfiles/blob/master/.config/nvim/init.vim
" Author: Guilherme Teixeira
" Description: My personal NEOVIMRC, built along the years in order to fulfill my
" needs. 

" =====================================================
" VIM-PLUG 
" =====================================================
call plug#begin('~/.vim/nvim_plugins')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Nerdtree
  Plug 'vim-airline/vim-airline'  " Status bar on bottom (Powerline/Airline)
  Plug 'vim-airline/vim-airline-themes' " Airline themes
  Plug 'jiangmiao/auto-pairs' "Auto add brackets etc.
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'gko/vim-coloresque'
call plug#end()

" =====================================================
" FEATURES
" =====================================================

set nocompatible " Avoid unexpected things that the OS may have made
set clipboard=unnamed " Copy to clipboard
set termguicolors
set cursorline
set encoding=utf-8 "Set encoding
set linebreak " Wraps lines without trimming words in the middle; breaks line instead
filetype indent plugin on

" =====================================================
" MUST HAVE options 
" =====================================================

set incsearch " Highlight search when entering a pattern
set hlsearch " Highlight searches
set showmatch
set inccommand=nosplit
set hidden " Managing multiple instances of Vim
set showcmd " Show partial commands in the last line of the screen
set noerrorbells " Disable error bells if you reach the end of the line
set ignorecase " Use case insensitive search, execpt when using capital letters
set smartcase " set smartcase
set laststatus=2 " Always display the status line, even if only one window is displayed
set confirm " Raise a dialogue asking if you wish to save changed files.
set mouse=a " Enable use of mouse for all modes
set number " Show line numbers
set relativenumber " Show line numbers relatively
set noswapfile " Disables creating swap files
set colorcolumn=79 " Column limit

" =====================================================
" APPEARANCE options 
" =====================================================

hi ColorColumn ctermbg=darkgrey guibg=green
set cursorline " Cursor customizations
hi CursorLineNR cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white



" =====================================================
" USABILITY options
" =====================================================
set backspace=indent,eol,start " Allow backspacing over autoindent, line breaks and start of insert action
set autoindent " Keeps the same indent as the line you're currently on

set ruler " Display the cursor position on the last line of the screen or in the status line of a window

set number " Show line numbers
set relativenumber " Show line numbers relatively 

" =====================================================
" INDENTATION options
" =====================================================
set tabstop=2 "number of tabs
set softtabstop=2
set shiftwidth=2
set expandtab

" =====================================================
" MAPPINGS
" C => Control | S => Shift
" =====================================================

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <C-C> <esc>

nnoremap <silent><c-s> :<c-u>update<cr> 
vnoremap <silent><c-s> <c-c>:update<cr>gv
inoremap <silent><c-s> <c-o>:update<cr> 

inoremap <S-Tab> <C-d> " o que este faz?

" Use <cr> to confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" OTHER options
" =====================================================
set t_Co=256
set showmatch
set enc=utf-8

set wildmenu " Better command-line completion

" =====================================================
" VIM-PLUG settings
" =====================================================

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
nmap <C-n> :NERDTreeToggle<CR>
set splitright

" Close Vim if only NerdTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  

""" DRACULA settings
colorscheme dracula
syntax on
