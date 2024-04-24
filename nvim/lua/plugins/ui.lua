return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("alpha").setup(require("alpha.themes.theta").config)
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {
        "akinsho/bufferline.nvim",
        opts = {},
    },
    require("plugins.ibl"),
    require("plugins.lualine"),
    require("plugins.scrollbar"),
    require("plugins.nvim-colorizer"),
}
