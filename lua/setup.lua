local M = {
    settings = {
        use_telescope = true,
        use_fzf = false,
        use_neotree = true,
        use_nvim_tree = false,
        use_bufferline = false,
        use_scope = true,
    }
}

M.setup_core = function()
    require("mason").setup()
    require("project_nvim").setup()

    require('possession').setup {
        session_dir = vim.fn.stdpath('data') .. '/sessions',
        silent = false,
        load_silent = true,
        debug = false,
        logfile = false,
        prompt_no_cr = false,
        autosave = {
            current = false,  -- or fun(name): boolean
            tmp = false,      -- or fun(): boolean
            tmp_name = 'tmp', -- or fun(): string
            on_load = true,
            on_quit = true,
        },
        commands = {
            save = 'PossessionSave',
            load = 'PossessionLoad',
            rename = 'PossessionRename',
            close = 'PossessionClose',
            delete = 'PossessionDelete',
            show = 'PossessionShow',
            list = 'PossessionList',
            migrate = 'PossessionMigrate',
        },
        hooks = {
            before_save = function(name) return {} end,
            after_save = function(name, user_data, aborted)
                vim.cmd([[ScopeSaveState]])
            end,
            before_load = function(name, user_data) return user_data end,
            after_load = function(name, user_data)
                vim.cmd([[ScopeLoadState]])
            end,
        },
        plugins = {
            close_windows = {
                hooks = { 'before_save', 'before_load' },
                preserve_layout = true, -- or fun(win): boolean
                match = {
                    floating = true,
                    buftype = {},
                    filetype = {},
                    custom = false, -- or fun(win): boolean
                },
            },
            delete_hidden_buffers = {
                hooks = {
                    'before_load',
                    vim.o.sessionoptions:match('buffer') and 'before_save',
                },
                force = false, -- or fun(buf): boolean
            },
            nvim_tree = true,
            neo_tree = true,
            symbols_outline = true,
            tabby = true,
            dap = true,
            dapui = true,
            neotest = true,
            delete_buffers = false,
        },
        telescope = {
            previewer = {
                enabled = true,
                previewer = 'pretty', -- or 'raw' or fun(opts): Previewer
                wrap_lines = true,
                include_empty_plugin_data = false,
                cwd_colors = {
                    cwd = 'Comment',
                    tab_cwd = { '#cc241d', '#b16286', '#d79921', '#689d6a', '#d65d0e', '#458588' }
                }
            },
            list = {
                default_action = 'load',
                mappings = {
                    save = { n = '<c-x>', i = '<c-x>' },
                    load = { n = '<c-v>', i = '<c-v>' },
                    delete = { n = '<c-t>', i = '<c-t>' },
                    rename = { n = '<c-r>', i = '<c-r>' },
                },
            },
        },
    }
    
    require("luasnip.loaders.from_vscode").lazy_load()

    require("neodev").setup({
        library = { plugins = { "nvim-dap-ui", "neotest" }, types = true }
    })

    require("lsp")

    require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    })

    if M.use_fzf then
        require("fzf-lua").setup({ "telescope" })
    end

    require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true
        },
    })
end

M.setup_cmp = function()
    local cmp = require("cmp")

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<cr>"] = cmp.mapping.confirm({ select = true }),
            ["<c-c>"] = cmp.mapping.close(),
        }),
        sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" } },
            { { name = "buffer" } }
        )
    })

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({ { name = 'git' } }, { { name = 'buffer' } })
    })

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
    })
end
M.setup_kitty = function()
    require('kitty-scrollback').setup()
end

M.setup_git = function()
    require("gitsigns").setup()
    require("neogit").setup()
end

M.setup_qol = function()
    require("colorizer").setup()
    require("nvim-autopairs").setup()
    require("Comment").setup()
    require("which-key").setup({
        window = {
            margin = { 5, 100, 0, 100 },
            border = "single",
            padding = { 0, 0, 0, 0 },
            position = "top",
        },
        layout = {
            spacing = 2,
            align = "center",
        },
        icons = {
            breadcrumb = "〕",
            separator = "⋅",
            group = "➥",
        },
    })
end

M.setup_telescope = function(settings)
    require('telescope').setup()
    require("telescope").load_extension("aerial")
    require("telescope").load_extension("scope")
    require("telescope").load_extension("notify")
    require("telescope").load_extension("projects")
    require("telescope").load_extension("possession")
end

M.setup_diagnostic = function()
    local dap = require('dap')
    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
        }
    }

    dap.configurations.rust = {
        name = "Launch",
        type = "codelldb",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = false,
    }

    require("dapui").setup()

    require("neotest").setup({
        adapters = {
            require("neotest-rust"),
            require("neotest-vim-test"),
        }
    })
end

M.setup_ui = function()
    require("startboard")
    require("noice").setup()
    require("aerial").setup({
        on_attach = function(bufnr)
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
    })
    require('tabby.tabline').use_preset('active_wins_at_tail', {
        theme = {
            fill = 'TabLineFill',       -- tabline background
            head = 'TabLine',           -- head element highlight
            current_tab = 'TabLineSel', -- current tab label highlight
            tab = 'TabLine',            -- other tab label highlight
            win = 'TabLine',            -- window highlight
            tail = 'TabLine',           -- tail element highlight
        },
        nerdfont = true,                -- whether use nerdfont
        lualine_theme = "tokyonight",   -- lualine theme name
        tab_name = {
            name_fallback = function(tabid)
                return tabid
            end,
        },
        buf_name = {
            mode = "'unique'|'relative'|'tail'|'shorten'",
        },

    })
    require("tokyonight").setup({
        style = "night",
        on_highlights = function(hl, c)
            local prompt = "#15161e"
            hl.TelescopeNormal = {
                bg = c.bg_dark,
                fg = c.fg_dark,
            }
            hl.TelescopeBorder = {
                bg = c.bg_dark,
                fg = c.bg_dark,
            }
            hl.TelescopePromptNormal = {
                bg = prompt,
            }
            hl.TelescopePromptBorder = {
                bg = prompt,
                fg = prompt,
            }
            hl.TelescopePromptTitle = {
                bg = prompt,
                fg = prompt,
            }
            hl.TelescopePreviewTitle = {
                bg = c.bg_dark,
                fg = c.bg_dark,
            }
            hl.TelescopeResultsTitle = {
                bg = c.bg_dark,
                fg = c.bg_dark,
            }
        end
    })
    require("fidget").setup()
    require("visual.incline")
    require("visual.lualine")

    if M.settings.use_bufferline then
        require("bufferline").setup()
    end

    if M.settings.use_scope then
        require("scope").setup()
    end
end

return M
