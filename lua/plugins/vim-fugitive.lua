vim.keymap.set("n", "<leader>ga", "<CMD>Git add .<CR>", { desc = "Git add", noremap = true })
vim.keymap.set("n", "<leader>gc", "<CMD>Git commit<CR>", { desc = "Git commit", noremap = true })
vim.keymap.set("n", "<leader>gp", "<CMD>Git push<CR>", { desc = "Git push", noremap = true })
vim.keymap.set("n", "<leader>gfp", "<CMD>Git push -f<CR>", { desc = "Git force push", noremap = true })
vim.keymap.set("n", "<leader>gs", "<CMD>Git status<CR>", { desc = "Git status", noremap = true })

return {
	"tpope/vim-fugitive",
}
