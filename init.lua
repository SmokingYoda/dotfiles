local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

require("plugins").getPlugins(Plug) -- Määrittää mitkä lisäosat ladataan.

vim.call('plug#end')

require("smokingyoda") -- Määrittää omat asetukset.
