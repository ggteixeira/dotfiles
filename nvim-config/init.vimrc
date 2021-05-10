call plug#begin('~/.vim/nvim_plugins')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'jiangmiao/auto-pairs' "Auto add brackets etc.
  Plug 'itchyny/lightline.vim'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'joshdick/onedark.vim'
  Plug 'gko/vim-coloresque'
  Plug 'ryanoasis/vim-devicons'
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'preservim/nerdcommenter'
  Plug 'alvan/vim-closetag'
call plug#end()
