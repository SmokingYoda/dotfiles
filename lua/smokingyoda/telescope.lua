local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		}
	}
})

telescope.load_extension("projects")
telescope.load_extension("advanced_git_search")
telescope.load_extension("noice")
