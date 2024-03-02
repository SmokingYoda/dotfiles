local keymap = vim.api.nvim_set_keymap;
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }
local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm(),
		["<Esc>"] = cmp.mapping.abort(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
	})
})

keymap("n", "<F10>", ":Telescope workspaces<CR>", default_opts)
keymap("n", "<leader><F3>", ":Telescope advanced_git_search diff_commit_file<CR>", default_opts)
keymap("n", "<F3>", ":Telescope find_files<CR>", default_opts)
keymap("n", "<F9>", ":RustRun<CR>", default_opts)
keymap("n", "<F7>", ":Telescope git_status<CR>", default_opts)
keymap("n", "<S-Up>", "<C-w>k", default_opts) -- Siirry ylempään ikkunaan
keymap("n", "<S-Down>", "<C-w>j", default_opts) -- Siirry alempaan ikkunaan
keymap("n", "<S-Right>", "<C-w>l", default_opts) -- Siirry oikeaan ikkunaan
keymap("n", "<S-Left>", "<C-w>h", default_opts) -- Siirry vasmpaan ikkunaan
keymap("n", "<C-q>s", ":wq<CR>", default_opts) -- Tallentaa ja poistuu
keymap("n", "<C-q>q", ":q!<CR>", default_opts) -- Hylkää ja poistuu
keymap("n", "<C-s>a", "ggVG", default_opts) -- Valitsee kaikki
keymap("n", "<C-a>", ":'<,'>sort<CR>", default_opts) -- Järjestää valitut
