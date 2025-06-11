vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Create options with description
function opts(desc)
	local opts = { noremap = true, silent = true, desc = desc }
	return opts
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts("Save file"))
vim.keymap.set("n", "<leader>o", organize_imports, opts("Organize imports"))
vim.keymap.set("n", "<leader>sn", "<cmd>noautocommand w<CR>", opts("Save without formatting"))
vim.keymap.set("n", "<C-D>", "yyp", opts("Copy & paste line (duplicate it)"))

vim.keymap.set("n", "<C-w>", "<cmd>q<CR>", opts("Quit file"))

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts("Vertical scroll down"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts("Vertical scroll up"))

vim.keymap.set("n", "n", "nzzzv", opts("Find and center right"))
vim.keymap.set("n", "N", "Nzzzv", opts("Find and center left"))

vim.keymap.set("n", "<S-Up>", ":resize -2<CR>", opts("Horizontal Resize -2"))
vim.keymap.set("n", "<S-Down>", ":resize +2<CR>", opts("Horizontal Resize +2"))
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", opts("Vertical Resize -2"))
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", opts("Vertical Resize +2"))

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts("Next buffer"))
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts("Prev buffer"))
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts("Close buffer"))                 -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts("New buffer"))                 -- new buffer

vim.keymap.set("n", "<leader>v", "<C-w>v", opts("Split window vertically"))             -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts("Split window horizontally"))           -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts("Equalize width & height of windows")) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts("Close current split window"))     -- close current split window

vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>", opts("split Move up"))
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>", opts("split Move down"))
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>", opts("split Move left"))
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>", opts("split Move right"))

vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts("New tab"))                      -- open new tab
vim.keymap.set("n", "<C-n>", ":tabnew<CR>", opts("New tab"))                           -- open new tab
vim.keymap.set("n", "<C-N>", ":tabnew <bar> :terminal <CR>", opts("New terminal tab")) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts("Close tab"))                  -- close current tab
vim.keymap.set("n", "<C-W>", ":tabclose<CR>", opts("Close tab"))                       -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts("Next tab"))                       --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts("Prev tab"))                       --  go to previous tab

vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts("Toggle line wrapping"))

vim.keymap.set("v", "<", "<gv", opts("Stay in indent mode left"))
vim.keymap.set("v", ">", ">gv", opts("Stay in indent mode right"))
vim.keymap.set("v", "p", '"_dP', opts("Keep last yanked when pasting"))

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d ", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "í", "<CMD> :NvimTreeOpen <CR>")

vim.keymap.set({ "n", "v" }, "é", "$", { desc = "End of line" })
vim.keymap.set({ "n", "v" }, "á", "^", { desc = "Start of line" })
vim.keymap.set("n", "cá", "c^", { desc = "Change Start of line" })
vim.keymap.set("n", "cé", "c$", { desc = "Change End of line" })
vim.keymap.set("n", "dá", "d^", { desc = "Delete Start of line" })
vim.keymap.set("n", "dé", "d$", { desc = "Delete End of line" })
