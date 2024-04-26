local opt = vim.opt
local o = vim.o
local g = vim.g

local set = vim.api.nvim_set_option

g.toggle_theme_icon = "   "
g.mapleader = " "
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

opt.clipboard:append("unnamedplus")
opt.cursorline = true
opt.cursorlineopt = "number"
opt.expandtab = true
opt.fillchars = { eob = " " }
opt.foldcolumn = '1'
opt.foldenable = true
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.ignorecase = true
opt.laststatus = 3
opt.mouse = "a"
opt.mousemoveevent = true
opt.number = true
opt.numberwidth = 4
opt.ruler = false
opt.shiftwidth = 4
opt.shortmess:append("sI")
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = false
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 250
opt.whichwrap:append("<>[]hl")

vim.cmd("colorscheme catppuccin-mocha")

local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
