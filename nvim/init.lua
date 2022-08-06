--[[

Neovim init file
Version: 0.59.2 - 2022/04/19
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require('packer_init')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
-- Themes
require('themes/nightfox')
require('themes/colorschemes')
require('themes/everforest')

require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-lsp-installer')
require('plugins/nvim-treesitter')
require('plugins/vim-closetag')
require('plugins/git-blame')
require('plugins/nvim-notify')
--require('plugins/null-ls')