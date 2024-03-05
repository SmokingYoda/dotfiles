local wk = require("which-key")

-- Visual mode mappings.

wk.register({
  [""] = {
    s = {
      name = "Search",
      g = { 'y<cmd>FzfLua grep<cr><c-r>"<cr>', "Grep selected text" }
    },
  }
}, { mode = "v" })

-- Normal mode mappings with space as leader.

wk.register({
  ["<leader>"] = {
    ["<leader>"] = {},
    q = {
      name = "Quit",
      q = { "<cmd>q!<cr>", "Discard and quit" },
      s = { "<cmd>wq!<cr>", "Save and quit" },
      Q = { "<cmd>qa!<cr>", "Discard all and quit" },
      S = { "<cmd>wqa!<cr>", "Save all and quit" },
    },
    f = {
      name = "FIles",
      F = { "<cmd>FzfLua files<cr>", "Show fiels with FzfLua" },
      f = { "<cmd>lua vim.lsp.buf.format { async = true}<cr>", "Show files with Telescope" },
      g = { "<cmd>FzfLua git_files<cr>", "Show git files with FzfLua" },
      d = { "<cmd>DiffviewFileHistory<cr>", "Show file history with Diffview" },
      c = { "<cmd>FzfLua git_bcommits<cr>", "Show git file commits with FzfLua" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Show git file commits with Telescope" },
      s = { "<cmd>FzfLua live_grep<cr>", "Fuzzy search" },
    },
    s = {
      name = "Search",
      w = { "<cmd>FzfLua live_grep<cr>", "Live grep with FzfLua" },
      W = { "<cmd>Telescope live_grep<cr>", "Live grep with Telescope" },
      h = { "<cmd>FzfLua search_history<cr>", "Search history with FzfLua" },
      H = { "<cmd>Telescope search_history<cr>", "Search history with Telescope" },
    },
    g = {
      name = "Git",
      f = {},
      c = {},
      d = {},
      C = {}
    },
  },
  ["_"] = {
    f = {
      name = "Format",
      f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format file" },
    },
    l = {
      name = "Line format",
      ["<up>"] = { "<cmd>m-2<cr>==", "Move line up." },
      ["<down>"] = { "<cmd>m+1<cr>==", "Move Line down" }
    }
  },
  [""] = {
    l = {
      name = "Left",
      l = { "<cmd>BufferLineCycleNext<cr>", "Next tab" },
    },
    h = {
      name = "Right",
      h = { "<cmd>BufferLineCyclePrev<cr>", "Previous tab" },
    },
    m = {
      name = "Move line",
      ["<up>"] = { "<cmd>m-2<cr>==", "Move line up." },
      ["<down>"] = { "<cmd>m+1<cr>==", "Move Line down" }
    }
  }
})
