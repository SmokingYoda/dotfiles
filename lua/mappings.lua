local map = vim.api.nvim_set_keymap

map("n", "<c-f>", ":FzfLua live_grep<cr>", {})
map("n", "ll", ":BufferLineCycleNext<cr>", {})
map("n", "hh", ":BufferLineCyclePrev<cr>", {})
map("n", "<f5>", ":MarkdownPreview<cr>", {})
map("n", "_rr", "ggVGD", {})
map("n", "_ff", ":lua vim.lsp.buf.format { async = true }<cr>", {})
map("n", "<a-h>r", "<c-v>0<del>", {})
map("n", "<a-j>", ":m+1<cr>==", {})
map("n", "<a-k>", ":m-2<cr>==", {})
map("n", "<a-l>r", "<c-v>$<del>", {})
map("n", "<c-down>", "<c-w>j", {})
map("n", "<c-left>", "<c-w>h", {})
map("n", "<c-right>", "<c-w>l", {})
map("n", "<c-up>", "<c-w>k", {})
map("n", "<f10>", ":Telescope projects<cr>", {})
map("n", "<f4>", ":DiffviewFileHistory<cr>", {})
map("n", "<f3>", ":FzfLua files<cr>", {})
