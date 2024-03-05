local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins")
local setup = require("setup")

require("lazy").setup({
	plugins.core_plugins,
	plugins.diagnostic_plugins,
	plugins.git_plugins,
	plugins.qol_plugins,
	plugins.ui_plugins,
	plugins.misc_plugins,
})

setup.setup_kitty()
setup.setup_ui()
setup.setup_core()
setup.setup_diagnostic()
setup.setup_git()
setup.setup_qol()

require("options")
require("mappings")
