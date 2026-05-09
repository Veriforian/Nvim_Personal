-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted things
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allow keeping current yank when putting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to shared clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without replacing cur yank
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- <C-c> mimics esc
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("x", "<C-c>", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>*", "*``")

-- Place lines without goin i mode
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

-- Get rid of EX mode
vim.keymap.set("n", "Q", "<nop>")

-- Unsetting defaults that conflict with preferred plugins
vim.keymap.set("n", "<C-m>", "<nop>")
vim.keymap.set("n", "<C-d>", "<nop>")
vim.keymap.set("v", "<C-m>", "<nop>")
vim.keymap.set("v", "<C-d>", "<nop>")

vim.keymap.set("t", "<C-c>", "<C-c><C-c>", { desc = "Exit terminal insert mode" })

vim.api.nvim_set_keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
