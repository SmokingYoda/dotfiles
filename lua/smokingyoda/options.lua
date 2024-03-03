vim.o.mousemoveevent = true
vim.api.nvim_set_var("mapleader", "_")
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

local options = {
	number = true,
	smartcase = true,
	ignorecase = true,
	tabstop = 4,
	shiftwidth = 4,
	clipboard = "unnamedplus",
	shiftround = true,
	linebreak = true,
	cursorline = true,
	swapfile = false,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.cmd.colorscheme("dracula")
