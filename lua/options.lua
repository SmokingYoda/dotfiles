vim.cmd("colorscheme tokyonight")

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      require("nvim-navic").attach(client, bufnr)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
}

local default_options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  cursorline = true,
  expandtab = true,
  fileencoding = "utf-8",
  foldexpr = "",
  foldmethod = "manual",
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  laststatus = 3,
  mouse = "a",
  number = true,
  numberwidth = 4,
  pumheight = 10,
  ruler = false,
  scrolloff = 8,
  shiftwidth = 2,
  showcmd = false,
  showmode = false,
  sidescrolloff = 8,
  signcolumn = "yes",
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 1000,
  title = true,
  undofile = true,
  updatetime = 100,
  wrap = false,
  writebackup = false,
}

for k, v in pairs(default_options) do
  vim.opt[k] = v
end
