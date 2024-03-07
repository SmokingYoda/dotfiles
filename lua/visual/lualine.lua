require("lualine").setup({
    options = { theme = "tokyonight" },
    extensions = { "fugitive", "fzf", "lazy", "man", "mason", "neo-tree", "nvim-dap-ui", "nvim-tree", "trouble", "aerial" },
    sections = {
        lualine_b = {
            {
                "tabs",
                path = 0,
                mode = 2,
                use_mode_colors = true,
                show_modified_status = true,
                symbols = { modified = "Δ" }
            }
        },
        lualine_a = { "branch", },
        lualine_c = { "encoding" },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_lsp", "nvim_diagnostic" },
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                update_in_insert = true,
                always_visible = true,
                colored = true
            }
        },
        lualine_y = { "Location" },
        lualine_z = { "filesize" },
    },
})
