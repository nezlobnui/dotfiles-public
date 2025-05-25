-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select all
keymap.set("n", "<Leader><C-a>", "gg<S-v>G")

-- Exit on jj and jk
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "jk", "<ESC>", opts)

-- Move to start/end of line
keymap.set({ "n", "x", "o" }, "H", "^", opts)
keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)
