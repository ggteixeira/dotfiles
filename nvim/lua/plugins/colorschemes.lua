return {
  -- Add themes
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "arcticicestudio/nord-vim", name = "nord" },

  -- Configure LazyVim to load the chosen colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-macchiato",
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "nord",
      -- colorscheme = "rose-pine",
      -- colorscheme = "everforest",
    },
  },
}
