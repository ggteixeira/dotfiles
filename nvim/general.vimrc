autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

set autoindent 
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,start,eol
set clipboard=unnamed,unnamedplus
set confirm
set cursorline
set expandtab
set hidden
set title
set nobackup
set nowritebackup
set hlsearch
set ignorecase
set smartcase
set inccommand=nosplit
set incsearch
set laststatus=2
set linebreak
set mouse=a
set noerrorbells
set number 
set noswapfile
set norelativenumber
set ruler 
set shiftwidth=2
set shortmess=I
set showcmd
set showmatch
set smartindent
set softtabstop=2
set splitbelow
set splitright
set synmaxcol=0
set t_Co=256
set tabstop=2 
set wildmenu
set lazyredraw
set background=dark
set noshowmode

colorscheme onedark

if (has("termguicolors"))
  set termguicolors
endif

" let g:onedark_termcolors=256

" colorscheme dracula
colorscheme carbon
" colorscheme nord

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

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
