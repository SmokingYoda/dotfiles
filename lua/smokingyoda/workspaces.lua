require("workspaces").setup({
	hooks = {
		open_pre = { "SessionsStop" },
		auto_open = true,
		open = { function()
			require("sessions").load(nil, { silent = true })
		end, "Telescope git_status"
		},
	}
})
