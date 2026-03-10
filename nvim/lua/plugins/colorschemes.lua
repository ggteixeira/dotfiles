return {
  -- Add themes
  { "catppuccin/nvim", lazy = true, name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "rmehri01/onenord.nvim", branch = "main" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/dracula.nvim" },
  -- { "nordtheme/vim", name = "nord" },
  { "arcticicestudio/nord-vim", name = "nord" },
  -- { "shaunsingh/nord.nvim", name = "nord" },

  -- Configure LazyVim to load the chosen colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-macchiato",
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-mocha",
      -- colorscheme = "nord",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "rose-pine",
      -- colorscheme = "everforest",
    },
  },
}
