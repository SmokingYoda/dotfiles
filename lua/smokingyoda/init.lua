local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

require("smokingyoda.plugins").getPlugins(Plug) -- Määrittää mitkä lisäosat ladataan.

vim.call('plug#end')

require("smokingyoda.ui")
require("smokingyoda.telescope")
require("smokingyoda.treesitter")
require("smokingyoda.luasnip")
require("smokingyoda.cmp")
require("smokingyoda.neodev")
require("smokingyoda.lspconfig")
require("smokingyoda.options")
require("smokingyoda.misc")
require("smokingyoda.mappings")
