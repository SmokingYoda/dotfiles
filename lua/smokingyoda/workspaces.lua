require("auto-session").setup({
	session_lens = {
		load_on_setup = true,
		theme_conf = { border = true },
		previewer = true,
	}
})

require("workspaces").setup({
	hooks = {
		open_pre = "SessionSave",
		open = "SessionsRestore",
	}
})
