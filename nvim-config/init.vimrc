call plug#begin('~/.vim/nvim_plugins')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Nerdtree
  Plug 'vim-airline/vim-airline'  " Status bar on bottom (Powerline/Airline)
  Plug 'vim-airline/vim-airline-themes' " Airline themes
  Plug 'jiangmiao/auto-pairs' "Auto add brackets etc.
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'gko/vim-coloresque'
call plug#end()
