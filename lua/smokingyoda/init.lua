vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

require("smokingyoda.plugins").getPlugins(Plug) -- Määrittää mitkä lisäosat ladataan.

vim.call('plug#end')

require("smokingyoda.ui") -- Made a stupid comment to see if my dumbass can push over SSH.
require("smokingyoda.workspaces")
require("smokingyoda.cmp")
require("smokingyoda.lspconfig")
require("smokingyoda.options")
require("smokingyoda.misc")
require("smokingyoda.mappings")
