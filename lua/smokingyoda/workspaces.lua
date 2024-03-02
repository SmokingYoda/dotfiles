require("sessions").setup({})

require("workspaces").setup({
	hooks = {
		load = function()
			require("session").load(nil, { silent = true })
		end,
		auto_open = true,
		open = { "Telescope find_files" },
	}
})
