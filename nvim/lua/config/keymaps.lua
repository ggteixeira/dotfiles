-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Use ; to access command mode:
vim.keymap.set("n", ";", ":")
vim.keymap.set("v", ";", ":")

-- Do the opposite to achieve the repeat functionality?
vim.keymap.set("n", ":", ";")
vim.keymap.set("v", ":", ";")

-- Use ctrl+n to toggle tree:
vim.keymap.set("n", "<C-n>", ":Neotree toggle <CR>", { silent = true })

-- Resizing windows (ctrl+shift+arrows)
vim.keymap.set("n", "<C-S-Up>", ":horizontal resize +1 <CR>", { silent = true })
vim.keymap.set("n", "<C-S-Down>", ":horizontal resize -1 <CR>", { silent = true })

vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2 <CR>", { silent = true })
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2 <CR>", { silent = true })

-- Enter Normal Mode quickly
vim.keymap.set("i", "jk", "<escape>")

-- Send the yanked text with 'x' to the Shadow Realm
-- vim.keymap.set("n", "x", '"_x"')

-- Select all lines
-- vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- -- Select line (like in VSCode)
-- vim.keymap.set("n", "<C-S-l>", "v0o$")
-- vim.keymap.set("i", "<C-S-l>", "<escape>v0o$i")

-- Move lines using shift+up/down
vim.keymap.set("n", "<C-S-Up>", "ddP")
vim.keymap.set("n", "<C-S-Down>", "ddp")
