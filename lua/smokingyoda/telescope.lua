local telescope = require("telescope")

telescope.setup({
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		file_browser = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
	}
})

telescope.load_extension("workspaces")
telescope.load_extension("advanced_git_search")
telescope.load_extension("noice")
