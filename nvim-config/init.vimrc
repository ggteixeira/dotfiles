call plug#begin('~/.vim/nvim_plugins')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Nerdtree
  Plug 'vim-airline/vim-airline'  " Status bar on bottom (Powerline/Airline)
  Plug 'vim-airline/vim-airline-themes' " Airline themes
  Plug 'jiangmiao/auto-pairs' "Auto add brackets etc.
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'
  Plug 'gko/vim-coloresque'
  Plug 'ryanoasis/vim-devicons'
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'luochen1990/rainbow'
call plug#end()
