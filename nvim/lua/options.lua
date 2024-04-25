local opt = vim.opt
local o = vim.o
local g = vim.g

g.toggle_theme_icon = "   "
g.mapleader = " "
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

o.cursorline = true
o.cursorlineopt = "number"
o.expandtab = true
o.foldcolumn = '1' -- '0' is not bad
o.foldenable = true
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldmethod = "expr"
o.ignorecase = true
o.laststatus = 3
o.mouse = "a"
o.mousemoveevent = true
o.number = true
o.numberwidth = 4
o.ruler = false
o.shiftwidth = 4
o.showmode = false
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = 4
o.splitbelow = true
o.splitright = true
o.tabstop = 4
o.timeoutlen = 400
o.undofile = true
o.updatetime = 250

opt.shortmess:append "sI"
opt.whichwrap:append "<>[]hl"
opt.fillchars = { eob = " " }
opt.termguicolors = true
opt.clipboard:append "unnamedplus"

vim.cmd("colorscheme catppuccin-mocha")

local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
