return {
  {
    "christoomey/vim-tmux-navigator",
    init = function()
      -- LazyVim registers its own <C-hjkl> window-nav keymaps on VeryLazy,
      -- which would overwrite this plugin's mappings. Delete them first so
      -- the keys spec below wins.
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          for _, key in ipairs({ "<C-h>", "<C-j>", "<C-k>", "<C-l>" }) do
            pcall(vim.keymap.del, "n", key)
          end
        end,
      })
    end,
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
