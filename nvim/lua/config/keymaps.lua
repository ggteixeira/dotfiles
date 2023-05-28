-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Use ; to access command mode:
vim.keymap.set("n", ";", ":")

-- Use ctrl+n to toggle tree:
vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", { silent = true })

-- Use Space+H to clear search
vim.keymap.set("n", "<Leader>h", ":noh<CR>")
