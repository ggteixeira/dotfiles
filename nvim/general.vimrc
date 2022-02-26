filetype indent plugin on
set incsearch
set hlsearch
set showmatch
set inccommand=nosplit
set hidden
set showcmd
set noerrorbells
set ignorecase
set smartcase
set laststatus=2
set confirm
set mouse=a
set number
set relativenumber
set noswapfile
set shortmess=I
set incsearch
set hlsearch
set showmatch
set inccommand=nosplit
set hidden
set showcmd
set noerrorbells
set ignorecase
set smartcase
set laststatus=2
set confirm
set mouse=a
set number
set relativenumber
set noswapfile
set shortmess=I
set nocompatible
set clipboard=unnamed,unnamedplus
set linebreak
set signcolumn=yes
set tabstop=2 "number of tabs
set softtabstop=2
set shiftwidth=2
set expandtab
set t_Co=256
set showmatch
set enc=utf-8
set wildmenu
set backspace=indent,start,eol
set autoindent 
set ruler 
set number 
set relativenumber 

" hi ColorColumn ctermbg=darkgrey guibg=green
set cursorline
" hi CursorLineNR cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white
" hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white

" hi ColorColumn ctermbg=darkgrey guibg=green
set cursorline " Cursor customizations
" hi CursorLineNR cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white
" hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

