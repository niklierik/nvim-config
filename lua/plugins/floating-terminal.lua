return {
	"numToStr/FTerm.nvim",
	config = function()
		vim.keymap.set("n", "<leader>tr", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<leader>tr", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
	end,
}
