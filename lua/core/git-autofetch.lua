local function auto_fetch()
	vim.fn.jobstart("git fetch --all", { detach = true })
end

-- Run every 5 minutes (300 000 ms)
vim.defer_fn(function()
	auto_fetch()
	vim.defer_fn(auto_fetch, 300000)
end, 300000)
