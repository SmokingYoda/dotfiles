return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ignore_install = {},
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "luadoc",
                "rust",
                "html",
                "tsx",
                "javascript",
                "typescript",
                "regex",
                "markdown",
                "markdown_inline",
                "sql",
                "zig",
                "yaml",
                "xml",
                "toml",
                "php",
                "phpdoc",
                "css",
                "python",
                "go",
                "objc",
                "make",
                "kotlin",
                "json",
                "jsdoc",
                "java",
                "csv",
                "cmake",
                "c_sharp",
                "c",
                "bash",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
        })
    end,
    lazy = true,
}
