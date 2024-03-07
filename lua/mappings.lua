local wk = require("which-key")
local nv = require("nvim-navbuddy.actions")

wk.register({
    ["<c-s>"] = { "y:FzfLua grep <c-r>0<cr>", "Search highlited in grep." },
}, { mode = "v" })

wk.register({
    ["<f10>"] = { ":Telescope projects<cr>", "Show projects." },
    ["<f3>"] = { ":FzfLua files<cr>", "Show files." },
    ["<f4>"] = { ":MarkdownPreview<cr>", "Show markdown preview." },
    ["<f5>"] = { ":RustRun<cr>", "Rust run." },
    ["<a-k>"] = { ":m+1<cr>==", "Move line up." },
    ["<a-j>"] = { ":m-2<cr>==", "Move line down." },
    ["<up>"] = { "<c-w>k", "Move to upper window." },
    ["<down>"] = { "<c-w>j", "Move to lower window." },
    ["<left>"] = { "<c-w>h", "Move to left window." },
    ["<right>"] = { "<c-w>l", "Move to right window." },
    [" F"] = { ":lua vim.lsp.buf.format({ async = true })<cr>", "Format current document." },
})
wk.register({
    ["h>"] = {
        name = "    Left Motion",
        h = { ":BufferLineCyclePrev<cr>", "Previous buffer." },
        r = { ":v0D", "Delete from cursor to start of line." },
    },
    ["l>"] = {
        name = "    Right Motions",
        l = { ":BufferLineCycleNext<cr>", "Next buffer." },
        r = { "v$D", "Delete from cursor to end of line." },
    },
    ["leader>"] = { ":lua vim.lsp.buf.hover()<cr>", "Show hover." },
    ["s>"] = {
        name = "    Show",
        t = { ":ToggleTerm<cr>", "Show terminal." },
        f = { ":Neotree float<cr>", "Show files." },
        g = { ":FzfLua git_files<cr>", "Show git files." },
        c = { ":FzfLua git_bcommits<cr>", "Show file commits." },
        s = { ":FzfLua live_grep<cr>", "Show search." },
        S = { ":Navbuddy<cr>", "Show file structure." },
        a = { ":AerialToggle<cr>", "Show aerial." },
    },
    ["r>"] = {
        name = "    Run",
        t = { ":TroubleToggle<cr>", "Run Trouble." },
        g = { ":Neogit<cr>", "Run Neogit." },
        d = { ":DiffviewToggleFiles<cr>", "Run Diffview." },
    },
    ["q>"] = {
        name = "    Quit",
        d = { ":DapTerminate<cr>", "Quit DAP." },
        s = { ":wq<cr>", "Save and quit." },
        ["<c-s>"] = { ":waq<cr>", "Save all and quit." },
        q = { ":q<cr>", "Quit." },
        Q = { ":q!<cr>", "Force quit." },
        ["<c-Q>"] = { "qa!<cr>", "Force quit all." },
        t = { ":tabclose<cr>", "Close tab." },
    },
    ["d>"] = {
        name = "    Debug",
        r = { ":TroubleRefresh<cr>", "Refresh Trouble." },
        c = { ":DapContinue<cr>", "Continue." },
        o = { ":DapStepOver<cr>", "Step Over." },
        O = { ":DapStepOut<cr>", "Step Out." },
        i = { ":DapStepInto<cr>", "Step Into." },
    },
    ["t>"] = {
        name = "    Tab motions",
        n = { ":tabnew<cr>", "New tab." },
    },
    ["g>"] = {
        name = "    Git",
        c = { ':!git checkout <c-r>0<cr>', "Checkout to clipboard." },
        C = { ":!git checkout master<cr>", "Checkout to master." }
    }

}, { prefix = "<c-" })
