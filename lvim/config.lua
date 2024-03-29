-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

vim.opt.wrap = true               -- display lines as one long line
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.timeoutlen = 150
vim.opt.spell = false

-- general
lvim.log.level = "warn"
lvim.format_on_save = {
  enabled = true,
  -- pattern = "*.a",
  timeout = 1500,
}

lvim.lsp.null_ls.setup.timeout_ms = 5000

-- to disable icons and use a minimalist setup, uncomment the following
lvim.use_icons = true

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
lvim.keys.insert_mode["<S-Tab>"] = "<C-d>"
lvim.keys.insert_mode["jk"] = "<escape>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

--statusline extra configs
lvim.builtin.lualine.style = "default" -- options: "lvim" (default), "default" or "none"

-- Tab Switch Buffer
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<cr>"

-- Override resize panes (to avoid conflicting with Logitech MX Anywhere's desktop movement gesture)
lvim.keys.normal_mode["<C-Left>"] = false
lvim.keys.normal_mode["<C-S-Left>"] = ":vertical resize -2<CR>"

lvim.keys.normal_mode["<C-Right>"] = false
lvim.keys.normal_mode["<C-S-Right>"] = ":vertical resize +2<CR>"

-- Vertical resizing
lvim.keys.normal_mode["<C-S-Up>"] = ":horizontal resize +1<CR>"
lvim.keys.normal_mode["<C-S-Down>"] = ":horizontal resize -1<CR>"

-- Comments
vim.api.nvim_set_keymap('n', '<Leader>/', 'gcc', { silent = false })

-- override a default keymapping
vim.api.nvim_set_keymap('n', ';', ':', { silent = false })
vim.api.nvim_set_keymap('v', ';', ':', { silent = false })

-- Undotree mappings:

lvim.keys.normal_mode['<C-S-n>'] = ":UndotreeToggle<CR> :UndotreeFocus<CR>"

-- -- Change theme settings
-- lvim.colorscheme = "everforest"
-- lvim.colorscheme = "dracula"
lvim.colorscheme = "gruvbox"
-- lvim.colorscheme = "onenord"
-- lvim.colorscheme = "onedark"

-- lvim.colorscheme = "catppuccin-latte"
-- lvim.colorscheme = "catppuccin-mocha"
-- lvim.colorscheme = "catppuccin-macchiato"
-- lvim.colorscheme = "catppuccin-frappe"


lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 40
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- TOGGLETERM configs
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = 'float'
lvim.builtin.terminal.start_in_insert = true
lvim.builtin.terminal.size = 30
-- lvim.builtin.terminal.close_on_exit = true

lvim.builtin.treesitter.ignore_install = { "haskell", "gitcommit" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

--- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("eslint", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
--

-- Null LS timeout
vim.lsp.buf.format({ timeout_ms = 2000 })

-- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "stylua" },
  {
    command = "prettier",
    args = { "--print-with", "100" },
    extra_args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  }
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {

  { "lunarvim/colorschemes" },
  { 'rmehri01/onenord.nvim',   branch = 'main' },
  { "sainnhe/everforest" },
  { "Mofiqul/dracula.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "p00f/nvim-ts-rainbow" },
  { "catppuccin/nvim",         name = "catppuccin" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "rasi" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "folke/persistence.nvim",
    lazy = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  { "mbbill/undotree" },
  { "tpope/vim-surround" }

}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
