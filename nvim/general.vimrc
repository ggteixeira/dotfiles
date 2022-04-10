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
set tabstop=2 
set wildmenu
set lazyredraw
set noshowmode
set t_Co=256

if (has("termguicolors"))
  set termguicolors
endif
set background=light

" handling setting and unsetting BAT_THEME for fzf.vim
" (Check the bat_themes list using bat --list-themes)
augroup update_bat_theme
    autocmd!
    autocmd colorscheme * call ToggleBatEnvVar()
augroup end
function ToggleBatEnvVar()
    if (&background == "light")
        let $BAT_THEME='base16'
    else
        let $BAT_THEME=''
    endif
endfunction

""" Everforest Theme
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
let g:everforest_enable_italic = 1


""" Set themes
" colorscheme everforest
" colorscheme dracula
" colorscheme carbon
" colorscheme PaperColor
" colorscheme nord
" colorscheme gruvbox
colorscheme dawnfox

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
