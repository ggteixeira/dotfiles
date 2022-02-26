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
set shortmess=I " Read :help shortmess for everything else.

" hi ColorColumn ctermbg=darkgrey guibg=green
set cursorline " Cursor customizations
" hi CursorLineNR cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white
" hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white

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
set shortmess=I " Read :help shortmess for everything else.

" hi ColorColumn ctermbg=darkgrey guibg=green
set cursorline " Cursor customizations
" hi CursorLineNR cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white
" hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE guibg=darkred guifg=white

set nocompatible " Avoid unexpected things that the OS may have made
" set clipboard=unnamed " Copy to clipboard
set clipboard=unnamed,unnamedplus
" set cursorline
set linebreak " Wraps lines without trimming words in the middle; breaks line instead
filetype indent plugin on
set signcolumn=yes

set tabstop=2 "number of tabs
set softtabstop=2
set shiftwidth=2
set expandtab

set t_Co=256
set showmatch
set enc=utf-8

" Better command-line completion
set wildmenu 

" Enables rescan when highlighting JS, JSX, TS, and TSX files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Allow backspacing over autoindent, line breaks and start of insert action
" set backspace=indent,eol,start 
set backspace=indent,start,eol

" Keeps the same indent as the line you're currently on
set autoindent 

" Display the cursor position on the last line of the screen or in the status line of a window
set ruler 

" Show line numbers
set number 

" Show line numbers relatively 
set relativenumber 
