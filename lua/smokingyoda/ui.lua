local hl = vim.api.nvim_set_hl

require("alpha").setup(require("alpha.themes.theta").config)

local noice = require("noice")

require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		}
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	}
})

local highlight = {
    "Blue",
    "Cyan",
    "Green",
    "Orange",
    "Red",
    "Violet",
    "Yellow",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    hl(0, "Blue", { fg = "#61AFEF" })
    hl(0, "Cyan", { fg = "#56B6C2" })
    hl(0, "Green", { fg = "#98C379" })
    hl(0, "Orange", { fg = "#D19A66" })
    hl(0, "Red", { fg = "#E06C75" })
    hl(0, "Violet", { fg = "#C678DD" })
    hl(0, "Yellow", { fg = "#E5C07B" })
end)

require("ibl").setup({ indent = { highlight = highlight }})

require("colorizer").setup({})

require("dressing").setup({})

require('lualine').setup({
	sections = {
		lualine_x = {
			{ noice.api.status.message.get_hl, cond = noice.api.status.message.has },
			{ noice.api.status.command.get, cond = noice.api.status.command.has, color = { fg = "#ff9e64" }},
			{ noice.api.status.mode.get, cond = noice.api.status.mode.has, color = { fg = "#ff9e64" }},
			{ noice.api.status.search.get, cond = noice.api.status.search.has, color = { fg = "#ff9e64" }}
		}
	}
})

require("dapui").setup({})
