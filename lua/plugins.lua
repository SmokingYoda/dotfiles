local M = {}

local which_key_init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

local markdown_init = function()
    vim.g.mkdp_filetypes = { "markdown" }
end

-- These are the plugins that I considern a
M.core_plugins = {
    {
        "jedrzejboczar/possession.nvim",
        dependencies = { "nvim-lua/plenary.nvim", { "tiagovla/scope.nvim", lazy = false, config = true } }
    },
    { "github/copilot.vim" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
    },
    { "folke/neodev.nvim" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp" },
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { -- Tällä hetkellä pirun hyvä telescopen korvike.
        "ibhagwan/fzf-lua",
        build = "./install --bin",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "williamboman/mason.nvim" },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", "3rd/image.nvim" },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
    },
    {
        "Saecki/crates.nvim",
        tag = "stable",
        event = { "BufRead Cargo.toml" },
    }
}

M.ui_plugins = {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
    },
    {
        "nanozuki/tabby.nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { -- NOU
        "stevearc/aerial.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }
    },
    {
        "j-hui/fidget.nvim",
        tag = "v1.0.0"
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl"
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "b0o/incline.nvim",
        event = "VeryLazy"
    },
    { "stevearc/dressing.nvim" },
    { "rcarriga/nvim-notify" },
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" }
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    { "SmiteshP/nvim-navbuddy", dependencies = { "neovim/nvim-lspconfig", "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim", "numToStr/Comment.nvim", "nvim-telescope/telescope.nvim" } }
}

M.diagnostic_plugins = {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim", "nvim-treesitter/nvim-treesitter" }
    },
    { "rouge8/neotest-rust" },
    { "vim-test/vim-test" },
    { "nvim-neotest/neotest-vim-test" },
}

M.git_plugins = {
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim" },
    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "ibhagwan/fzf-lua" }
    }
}

M.qol_plugins = {
    { "ahmedkhalf/project.nvim" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = which_key_init()
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    { "NvChad/nvim-colorizer.lua" },
    {
        "iamcco/markdown-preview.nvim",
        init = markdown_init(),
        build = "cd app && yarn install",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" }
    },
    {
        "numToStr/Comment.nvim",
        lazy = false
    }
}

M.misc_plugins = {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        opts = {},
        build = function()
            vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy"
    },
    { "akinsho/toggleterm.nvim", version = "*", config = true },
    {
        "mikesmithgh/kitty-scrollback.nvim",
        enabled = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
        event = { 'User KittyScrollbackLaunch' },
        version = "^4.0.0"
    }
}

return M
