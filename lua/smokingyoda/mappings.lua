local keymap = vim.api.nvim_set_keymap;
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("n", "<C-a>", "viB:sort<CR>", default_opts)
keymap("n", "<C-Up>", "<C-w>h", default_opts)
keymap("n", "<C-Down>", "<C-w>l", default_opts)
keymap("n", "<C-Left>", "<C-w>j", default_opts)
keymap("n", "<C-Right>", "<C-w>k", default_opts)
