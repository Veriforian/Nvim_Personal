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

vim.keymap.set("n", "<leader>*", "*``")

-- Place lines without goin i mode
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

-- Get rid of EX mode
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("t", "<C-c>", "<C-c><C-c>", { desc = "Exit terminal insert mode" })

-- DAP Breakpoint keymaps
local dapbp_api = require("dap-breakpoints.api")
local dapbp_keymaps = {
  { "<leader>dts", dapbp_api.set_breakpoint, desc = "Set Breakpoint" },
  { "<leader>dtc", dapbp_api.set_conditional_breakpoint, desc = "Set Conditional Breakpoint" },
  { "<leader>dth", dapbp_api.set_hit_condition_breakpoint, desc = "Set Hit Condition Breakpoint" },
  { "<leader>dtl", dapbp_api.set_log_point, desc = "Set Log Point" },
  { "<leader>dte", dapbp_api.edit_property, desc = "Edit Breakpoint Property" },
  {
    "<leader>dtE",
    function()
      dapbp_api.edit_property({ all = true })
    end,
    desc = "Edit All Breakpoint Properties",
  },
  { "<leader>dtv", dapbp_api.toggle_virtual_text, desc = "Toggle Breakpoint Virtual Text" },
  { "<leader>dtC", dapbp_api.clear_all_breakpoints, desc = "Clear All Breakpoints" },
  { "[b", dapbp_api.go_to_previous, desc = "Go to Previous Breakpoint" },
  { "]b", dapbp_api.go_to_next, desc = "Go to Next Breakpoint" },
  { "<M-b>", dapbp_api.popup_reveal, desc = "Reveal Breakpoint" },
}
for _, keymap in ipairs(dapbp_keymaps) do
  vim.keymap.set("n", keymap[1], keymap[2], { desc = keymap.desc })
end

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set({ "n", "t" }, "<C-_>", function()
  local count = vim.v.count1
  require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
end, { desc = "ToggleTerm Default vertical terminal", noremap = true, silent = true })
