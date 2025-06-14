-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resizing windows (ctrl+shift+arrows)
vim.keymap.set("n", "<C-S-Up>", ":horizontal resize +1 <CR>", { silent = true })
vim.keymap.set("n", "<C-S-Down>", ":horizontal resize -1 <CR>", { silent = true })

vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2 <CR>", { silent = true })
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2 <CR>", { silent = true })

-- Use ; to access command mode:
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Do the opposite to achieve the repeat functionality?
vim.keymap.set("n", ":", ";")
vim.keymap.set("v", ":", ";")
