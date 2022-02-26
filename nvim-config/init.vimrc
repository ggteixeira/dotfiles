call plug#begin('~/.vim/nvim_plugins')
  " Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' | 
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'
  Plug 'gko/vim-coloresque'
  Plug 'ryanoasis/vim-devicons'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'alvan/vim-closetag'
  Plug 'dylanaraps/wal.vim'
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'alvan/vim-closetag'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'michaeldyrynda/carbon'
call plug#end()

