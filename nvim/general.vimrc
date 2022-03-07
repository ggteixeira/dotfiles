autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
filetype indent plugin on

let g:loaded_2html_plugin      = 0
let g:loaded_gzip              = 0
let g:loaded_logiPat           = 0
let g:loaded_matchit           = 0
let g:loaded_matchparen        = 0
let g:loaded_netrw             = 0
let g:loaded_netrwPlugin       = 0
let g:loaded_remote_plugins    = 0
let g:loaded_rrhelper          = 0
let g:loaded_shada_plugin      = 0
let g:loaded_spellfile_plugin  = 0
let g:loaded_tarPlugin         = 0
let g:loaded_tutor_mode_plugin = 0
let g:loaded_zipPlugin         = 0

set autoindent 
set backspace=indent,start,eol
set clipboard=unnamed,unnamedplus
set confirm
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set smartcase
set inccommand=nosplit
set incsearch
set laststatus=2
set linebreak
set mouse=a
set nocompatible
set nocursorcolumn
set noerrorbells
set nonumber 
set noswapfile
set relativenumber
set ruler 
set shiftwidth=2
set shortmess=I
set showcmd
set showmatch
set signcolumn=yes
set smartindent
set softtabstop=2
set splitbelow
set splitright
set synmaxcol=200
set t_Co=256
set tabstop=2 
set wildmenu
