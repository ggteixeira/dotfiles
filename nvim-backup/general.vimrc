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

""" Highlight current active buffer

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
" from 
if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ""
      if i != winnr()
        if &wrap
         " HACK: when wrapping lines is enabled, we use the maximum number
         " of columns getting highlighted. This might get calculated by
         " looking for the longest visible line and using a multiple of
         " winwidth().
         let l:width=256 " max
        else
         let l:width=winwidth(i)
        endif
        let l:range = join(range(1, l:width), ',')
      endif
      call setwinvar(i, '&colorcolumn', l:range)
    endfor
  endfunction

  augroup DimInactiveWindows
    au!
    au WinEnter * call s:DimInactiveWindows()
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
  augroup END
endif" handling setting and unsetting BAT_THEME for fzf.vim

" (Check the bat_themes list using bat --list-themes)
augroup update_bat_theme
    autocmd!
    autocmd colorscheme * call ToggleBatEnvVar()
augroup end

function ToggleBatEnvVar()
    if (&background == "light")
        let $BAT_THEME='GitHub'
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
" colorscheme nordfox
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
