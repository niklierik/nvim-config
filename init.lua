-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
