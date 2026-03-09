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
}
