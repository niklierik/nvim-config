-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.opt.clipboard = "unnamedplus"
