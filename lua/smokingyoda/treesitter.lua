require("nvim-treesitter.configs").setup({
	auto_install = false,
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "xml", "typescript", "tsx", "tmux", "regex", "php", "json", "javascript", "html", "css", "c_sharp" },
	highlight = { enable = true },
	sync_install = true,
})
