return {
  { "rmehri01/onenord.nvim", branch = "main" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/dracula.nvim" },
  -- { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  { "catppuccin/nvim", lazy = false, name = "catppuccin" },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    name = "gruvbox",
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-latte",
      colorscheme = "rose-pine-moon",
      -- colorscheme = "rose-pine-main",
      -- colorscheme = "rose-pine-dawn", -- light version
      -- colorscheme = "gruvbox",
      -- colorscheme = "dracula",
      -- colorscheme = "everforest",
      -- colorscheme = "onenord",
    },
  },
}
