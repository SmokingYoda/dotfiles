require("sessions").setup({})
require("session_manager").setup({})
require("workspaces").setup({
	hooks = {
		load = { function()
			require("sessions").save(nil, { silent = true })
		end
		},
		open_pre = { "SessionsStop" },
		auto_open = true,
		open = { function()
			require("sessions").load(nil, { silent = true })
		end, "Telescope git_status"
		},
	}
})
