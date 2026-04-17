return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    config = function()
      -- Set after VeryLazy so we overwrite any LazyVim default window-nav maps.
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>",     { silent = true })
          vim.keymap.set("n", "<BS>",  "<cmd>TmuxNavigateLeft<cr>",     { silent = true })
          vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>",     { silent = true })
          vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>",       { silent = true })
          vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>",    { silent = true })
          vim.keymap.set("n", "<C-\\>","<cmd>TmuxNavigatePrevious<cr>", { silent = true })
        end,
      })
    end,
  },
}
