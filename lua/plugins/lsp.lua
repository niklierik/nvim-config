local json_settings = {
	format = {
		enable = false,
	},
	-- Schemas https://www.schemastore.org
	schemas = {
		{
			fileMatch = { "package.json" },
			url = "https://json.schemastore.org/package.json",
		},
		{
			fileMatch = { "tsconfig.json" },
			url = "https://json.schemastore.org/tsconfig.json",
		},
		{
			fileMatch = { "tsconfig*.json" },
			url = "https://json.schemastore.org/tsconfig.json",
		},
		{
			fileMatch = {
				".prettierrc",
				".prettierrc.json",
				"prettier.config.json",
			},
			url = "https://json.schemastore.org/prettierrc.json",
		},
		{
			fileMatch = { ".eslintrc", ".eslintrc.json" },
			url = "https://json.schemastore.org/eslintrc.json",
		},
		{
			fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
			url = "https://json.schemastore.org/babelrc.json",
		},
		{
			fileMatch = { "lerna.json" },
			url = "https://json.schemastore.org/lerna.json",
		},
		{
			fileMatch = { "now.json", "vercel.json" },
			url = "https://json.schemastore.org/now.json",
		},
		{
			fileMatch = {
				".stylelintrc",
				".stylelintrc.json",
				"stylelint.config.json",
			},
			url = "http://json.schemastore.org/stylelintrc.json",
		},
	},
}

vim.diagnostic.config({ virtual_text = true })

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"jose-elias-alvarez/typescript.nvim",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			client.server_capabilities.documentFormattingProvider = false

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			vim.keymap.set("n", "<leader>t", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end
		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure typescript server with plugin
		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			on_attach = on_attach,
			-- 16 gb
			maxTsServerMemory = 16000,
			filetypes = { "typescript" },
			settings = {
				typescript = {
					preferences = {
						importModuleSpecifier = "project-relative",
					},
				},
			},
		})

		vim.lsp.config("eslint", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"typescript",
				"javascript",
				"htmlangular",
			},
		})

		vim.lsp.config("pylsp", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"python",
			},
		})

		vim.lsp.config("clangd", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"cpp",
			},
		})

		-- configure css server
		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "css", "scss" },
		})

		vim.lsp.config("somesass_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "scss" },
		})

		vim.lsp.config("angularls", {
			capabilities = capabilities,
			on_attach = on_attach,

			filetypes = { "html", "htmlangular" },
		})

		-- configure json-lsp server
		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				json = json_settings,
				jsonc = json_settings,
			},

			filetypes = { "json", "jsonc" },
		})
		vim.lsp.config("csharp_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "cs" },
		})

		vim.lsp.config("csharpier", {
			filetypes = { "csharp" },
		})

		vim.lsp.config("docker_compose_language_service", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "yaml" },
		})

		vim.lsp.config("bashls", {
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "sh" },
		})

		-- configure lua server (with special settings)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
			filetypes = { "lua" },
		})
	end,
}
