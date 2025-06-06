-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>_", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local ng = require("ng")
vim.keymap.set(
  "n",
  "<leader>T",
  ng.goto_template_for_component,
  { noremap = true, silent = true, desc = "Go to template for component" }
)
vim.keymap.set(
  "n",
  "<leader>t",
  ng.goto_component_with_template_file,
  { noremap = true, silent = true, desc = "Go to component from template" }
)
-- vim.keymap.set("n", "<leader>T", ng.get_template_tcb, { noremap = true, silent = true, desc = "Get template tcb" })
