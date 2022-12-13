--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "gruvbox"
lvim.colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "macchiato"
vim.g.catppuccin_flavour = "mocha"
-- vim.g.catppuccin_flavour = "frappe"
-- vim.g.catppuccin_flavour = "latte"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.relativenumber = true
vim.opt.wrap = true -- display lines as one long line
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.timeoutlen = 150
vim.opt.spell = false
-- Disable virtual text
lvim.lsp.diagnostics.virtual_text = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<C-\\>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
lvim.keys.insert_mode["<S-Tab>"] = "<C-d>"

--statusline extra configs
lvim.builtin.lualine.style = "default" -- options: "lvim" (default), "default" or "none"

-- Tab Switch Buffer
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<cr>"

-- Comments
vim.api.nvim_set_keymap('n', '<Leader>/', 'gcc', { silent = false })

-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
vim.api.nvim_set_keymap('n', ';', ':', { silent = false })
vim.api.nvim_set_keymap('v', ';', ':', { silent = false })
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- TOGGLETERM configs

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = 'float'
lvim.builtin.terminal.start_in_insert = true
lvim.builtin.terminal.size = 30
-- lvim.builtin.terminal.close_on_exit = true

-- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "c",
--   "javascript",
--   "json",
--   "lua",
--   "python",
--   "typescript",
--   "tsx",
--   "jsx",
--   "css",
--   "rust",
--   "java",
--   "yaml",
-- }

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true

-- generic LSP settings

---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)
require("lvim.lsp.manager").setup("eslint", opts)
require("lvim.lsp.manager").setup("emmet_ls", opts)

---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skiipped for the current filetype
vim.tbl_map(function(server)
  return server ~= ""
end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "4000" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html",
      "json", "jsonc", "yaml", "markdown", "graphql", "handlebars" }
  },
  -- {
  --   command = "eslint",
  --   extra_args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
  --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  -- },

}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
}

-- Additional Plugins
lvim.plugins = {
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()
  --     local blankline_opts = {
  --       filetype_exclude = {
  --         "alpha",
  --         "help",
  --         "terminal",
  --         "dashboard",
  --         "lspinfo",
  --         "lsp-installer",
  --         "mason",
  --       },
  --       buftype_exclude = { "terminal" },
  --       bufname_exclude = { "config.lua" },

  --       show_trailing_blankline_indent = false,
  --       show_first_indent_level = false,
  --       -- use_treesitter = true,
  --       space_char_blankline = " ",
  --       show_current_context = true,
  --       show_current_context_start = true,
  --     }

  --     require("indent_blankline").setup(blankline_opts)
  --   end
  -- },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  { "rmehri01/onenord.nvim" },
  { "lunarvim/colorschemes" },
  { "sainnhe/everforest" },
  { "Mofiqul/dracula.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "p00f/nvim-ts-rainbow" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "rasi" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "catppuccin/nvim",
    -- conf = function()
    --   return lvim and lvim.colorscheme == "catppuccin"
    -- end,
    config = function()
      require('catppuccin').setup({
        transparent_background = false,
        term_colors = true,
        styles = {
          comments = { 'bold' },
          conditionals = { 'bold' },
          functions = { 'bold' },
          keywords = { 'bold' },
          types = { 'bold' },
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { 'undercurl' },
              hints = { 'undercurl' },
              warnings = { 'undercurl' },
              information = { 'undercurl' },
            },
          },
          lsp_trouble = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = {
            transparent_panel = true,
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          bufferline = true,
          markdown = true,
          hop = true,
          notify = true,
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
}
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--   event = "BufReadPre", -- this will only start session saving when an actual file was opened
--   module = "persistence",
--   config = function()
--     require("persistence").setup {
--       dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
--       options = { "buffers", "curdir", "tabpages", "winsize" },
--     }
--   end,
-- },
