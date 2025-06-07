vim.keymap.set("n", "<leader>ga", "<CMD>Git add .<CR>", { desc = "Git add", noremap = true })
vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>", { desc = "Git add", noremap = true })
vim.keymap.set("n", "<leader>gp", "<CMD>Git push<CR>", { desc = "Git add", noremap = true })

return {
	"tpope/vim-fugitive",
}
