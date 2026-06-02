-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local o = vim.keymap

o.set("i", "kj", "<Esc>", { noremap = true, silent = true })
o.set("t", "kj", [[<C-\><C-n>]], { noremap = true, silent = true }) -- terminal mode
