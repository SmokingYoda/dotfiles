local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.treesitter"),
    require("plugins.mason"),
    require("plugins.lspconfig"),
    require("plugins.gitsigns"),
    require("plugins.todo-comments"),
    require("plugins.whichkey"),
    require("plugins.comment"),
    require("plugins.ui"),
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        config = function()
            require('treesj').setup()
        end,
        lazy = false,

    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim", -- optional - Diff integration
        },
        opts = {},
        lazy = false,

    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "3rd/image.nvim",
        },
        opts = {},
        lazy = false,

    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
        lazy = false,

    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            defaults = {
                mappings = {},
                pickers = {},
                extensions = { "projects" },
            }
        },
        lazy = false,

    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        opts = {},
        lazy = false,

    },
    {
        "rcarriga/nvim-notify",
        opts = {},
        lazy = false,

    },
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        opts = {},
        lazy = false,

    },
    {
        "kylechui/nvim-surround",
        version = "main",
        event = "VeryLazy",
        opts = {},
        lazy = false,

    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                rust = { "ast-grep" },
                bash = { "beatysh" },
            },
        },
        lazy = false,

    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop"
        },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
        lazy = false,

    },
    {
        "folke/zen-mode.nvim",
        opts = {},
        lazy = false,

    },
    {
        "danymat/neogen",
        opts = {
            snippet_engine = "luasnip"
        },
        lazy = false,

    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup()
        end,
        lazy = false,
    },
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("fzf-lua").setup({})
        end
    },
})

require("options")
require("mappings")
