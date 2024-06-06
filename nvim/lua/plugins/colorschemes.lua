return {
  { "rmehri01/onenord.nvim", branch = "main" },
  { "sainnhe/everforest" },
  { "Mofiqul/dracula.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        bold_vert_split = true, -- use bold vertical separators
        dim_nc_background = false, -- dim 'non-current' window backgrounds
        disable_background = false, -- disable background
        disable_float_background = false, -- disable background for floats
        disable_italics = false, -- disable italics
      })
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      vim.cmd("colorscheme poimandres")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-latte",
      -- colorscheme = "rose-pine-moon",
      -- colorscheme = "rose-pine-main",
      -- colorscheme = "rose-pine-dawn", -- light version
      -- colorscheme = "poimandres",
      -- colorscheme = "gruvbox",
      -- colorscheme = "everforest",
      -- colorscheme = "dracula",
      -- colorscheme = "onenord",
    },
  },
}
