local wk = require("which-key").register

wk({
    [" f"] = { ":lua vim.lsp.buf.format()<cr>", "Format current document." },
    ["<c-l>"] = { "v$hd", "Remove from cursor to the end of the line." },
    ["<c-h>"] = { "v0d", "Remove from cursor to the start of the line." },
    ["<c-k>"] = { ":m-2<cr>==", "Move line up." },
    ["<c-j>"] = { ":m+1<cr>==", "Move line up." },
    ["<f3>"] = { ":Telescope fd<cr>", "Find." },
    ["<c-f>"] = { ":Telescope current_buffer_fuzzy_find<cr>", "Find." },
    [" s"] = { "viB:sort<cr>", "Sort current paragraph" },
})
