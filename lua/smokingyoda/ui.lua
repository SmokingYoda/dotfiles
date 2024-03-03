local noice = require("noice")

require("dressing").setup({})
require("alpha").setup(require("alpha.themes.theta").config)

noice.setup({
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

require('lualine').setup({
	options = { theme = "dracula-nvim" },
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
