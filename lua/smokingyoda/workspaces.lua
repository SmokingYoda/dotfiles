require("workspaces").setup({
	hooks = {
		auto_open = true,
		open = { "Telescope find_files" },
	}
})
