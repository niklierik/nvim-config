return {
	"nvim-neotest/neotest",
	dependencies = {
		"marilari88/neotest-vitest",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		adapters = {
			["neotest-vitest"] = {},
		},
	},
	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"<leader>Twr",
			"<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
			{ desc = "Run Watch" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>Twf",
			"<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>",
			{ desc = "Run Watch File" }
		)
	end,
}
