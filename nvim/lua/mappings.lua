local wk = require("which-key").register

wk({
    ["<c-s>"] = {
        ["g"] = {
            ["c"] = { ":FzfLua git_bcommits<cr>", "Show current file commits." },
            ["n"] = { ":Neogit<cr>", "Show neogit." },
            ["p"] = { ":FzfLua git_commits<cr>", "Show project commits." },
            name = "    Press g to show git states.",
        },
        ["l"] = {
            ["c"] = { ":FzfLua lsp_declarations<cr>", "Show declarations." },
            ["f"] = { ":FzfLua lsp_definitions<cr>", "Show definitions." },
            ["h"] = { ":lua vim.lsp.buf.hover()<cr>", "Show hover." },
            ["i"] = { ":FzfLua lsp_implementations<cr>", "Show implementations." },
            ["r"] = { ":FzfLua lsp_references<cr>", "Show references." },
            name = "    Press l to show LSP states",
        },
        ["t"] = { ":TroubleToggle<cr>", "Toggle trouble." },
        ["n"] = { ":Neotree toggle<cr>", "Toggle neotree." },
        ["z"] = { ":ZenMode<cr>", "Toggle zen mod." },
        ["p"] = { ":Telescope projects<cr>", "Show projects." },
        ["m"] = { ":MarkdownPreviewToggle<cr>", "Show markdown." },
        name = "Show git, lsp and other plugins.",
    },
    ["<c-e>"] = {
        ["<down>"] = { ":m+1<cr>==", "Move line down." },
        ["<left>"] = { "v0d", "Remove from cursor to the start of the line." },
        ["<right>"] = { "v$hd", "Remove from cursor to the end of the line." },
        ["<up>"] = { ":m-2<cr>==", "Move line up." },
        ["b"] = { "viB:sort<cr>", "Sort inside {}" },
        ["p"] = { "vib:sort<cr>", "Sort inside ()."},
        ["r"] = { ":lua vim.lsp.buf.rename()<cr>", "Rename selected." },
        name = "Edit",
    },
    ["<c-d>"] = {
        ["D"] = { ":qa!<cr>", "Discard all and quit." },
        ["Q"] = { ":waq<cr>", "Save all and quit." },
        ["S"] = { ":wa<cr>", "Save all." },
        ["d"] = { ":q!<cr>", "Discard current and quit." },
        ["q"] = { ":wq<cr>", "Save and quit." },
        ["s"] = { ":w:<cr>", "Save." },
        name = "File",
    },
    ["<c-f>"] = {
        name = "Search",
        ["c"] = { ":FzfLua grep_cword<cr>", "Find word under cursor." },
        ["d"] = { ":FzfLua lgrep_curbuf<cr>", "Search current file." },
        ["f"] = { ":FzfLua live_grep<cr>", "Search project." },
    },
    [" f"] = { ":lua vim.lsp.buf.format({ async = true})<cr>", "Format current file." },
})

wk({
    ["<c-f>"] = { "<esc>:FzfLua lgrep_curbuf<cr>", "Search current file." },
    ["<c-s>"] = { "<esc>:FzfLua grep_cword<cr>", "Search word under cursor." },
    ["<c-h>"] = { "<esc>:lua vim.lsp.buf.rename()<cr>", "Rename selected." },
}, { mode = "i" })

wk({
    ["<c-s>"] = { ":sort<cr>", "Sort selected." },
}, { mode = "v" })
