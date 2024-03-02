require("nvim-autopairs").setup({})

local autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" } },
		{ { name = "buffer" } })
})

cmp.event:on("confirm_done", autopairs.on_confirm_done())


cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
			{ name = "git" } },
		{ { name = "buffer" } })
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } }
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
			{ name = "path" } },
		{ { name = "cmdline" } })
})
