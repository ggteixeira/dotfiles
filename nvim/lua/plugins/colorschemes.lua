return {
  -- Add themes
  { "catppuccin/nvim", lazy = false, name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "rmehri01/onenord.nvim", branch = "main" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load the chosen colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "catppuccin-mocha",
    },
  },
}
