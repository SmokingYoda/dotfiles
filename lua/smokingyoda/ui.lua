require("colorizer").setup({})

local noice = require("noice")

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({ indent = { highlight = highlight }})

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
		lualine_c = { require("auto-session.lib").current_session_name },
		lualine_x = {
			{ noice.api.status.message.get_hl, cond = noice.api.status.message.has },
			{ noice.api.status.command.get, cond = noice.api.status.command.has, color = { fg = "#ff9e64" }},
			{ noice.api.status.mode.get, cond = noice.api.status.mode.has, color = { fg = "#ff9e64" }},
			{ noice.api.status.search.get, cond = noice.api.status.search.has, color = { fg = "#ff9e64" }}
		}
	}
})

require("dapui").setup({})
