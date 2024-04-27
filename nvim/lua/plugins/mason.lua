return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "mrcjkb/rustaceanvim",
        {
            "ray-x/go.nvim",
            dependencies = { -- optional packages
                "ray-x/guihua.lua",
            },
            config = function()
                require("go").setup()
            end,
            event = { "CmdlineEnter" },
            ft = { "go", 'gomod' },
            build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
        },
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                {
                    "kevinhwang91/nvim-ufo",
                    dependencies = { "kevinhwang91/promise-async" }
                }
            },
            config = function()
                local navbuddy = require("nvim-navbuddy")
                local actions = require("nvim-navbuddy.actions")
                navbuddy.setup({
                    window = {
                        border = "single", -- "rounded", "double", "solid", "none"
                        size = "60%",      -- Or table format example: { height = "40%", width = "100%"}
                        position = "50%",  -- Or table format example: { row = "100%", col = "0%"}
                        scrolloff = nil,   -- scrolloff value within navbuddy window
                        sections = {
                            left = {
                                size = "20%",
                                border = nil, -- You can set border style for each section individually as well.
                            },
                            mid = {
                                size = "40%",
                                border = nil,
                            },
                            right = {
                                border = nil,
                                preview = "leaf", -- Right section can show previews too.
                            }
                        },
                    },
                    node_markers = {
                        enabled = true,
                        icons = {
                            leaf = "  ",
                            leaf_selected = " → ",
                            branch = " ",
                        },
                    },
                    icons = {
                        File          = "󰈙 ",
                        Module        = " ",
                        Namespace     = "󰌗 ",
                        Package       = " ",
                        Class         = "󰌗 ",
                        Method        = "󰆧 ",
                        Property      = " ",
                        Field         = " ",
                        Constructor   = " ",
                        Enum          = "󰕘",
                        Interface     = "󰕘",
                        Function      = "󰊕 ",
                        Variable      = "󰆧 ",
                        Constant      = "󰏿 ",
                        String        = " ",
                        Number        = "󰎠 ",
                        Boolean       = "◩ ",
                        Array         = "󰅪 ",
                        Object        = "󰅩 ",
                        Key           = "󰌋 ",
                        Null          = "󰟢 ",
                        EnumMember    = " ",
                        Struct        = "󰌗 ",
                        Event         = " ",
                        Operator      = "󰆕 ",
                        TypeParameter = "󰊄 ",
                    },
                    use_default_mappings = true,     -- If set to false, only mappings set
                    mappings = {
                        ["<esc>"] = actions.close(), -- Close and cursor to original location
                        ["q"] = actions.close(),

                        ["j"] = actions.next_sibling(),     -- down
                        ["k"] = actions.previous_sibling(), -- up

                        ["h"] = actions.parent(),           -- Move to left panel
                        ["l"] = actions.children(),         -- Move to right panel
                        ["0"] = actions.root(),             -- Move to first panel

                        ["v"] = actions.visual_name(),      -- Visual selection of name
                        ["V"] = actions.visual_scope(),     -- Visual selection of scope

                        ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
                        ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

                        ["i"] = actions.insert_name(),      -- Insert at start of name
                        ["I"] = actions.insert_scope(),     -- Insert at start of scope

                        ["a"] = actions.append_name(),      -- Insert at end of name
                        ["A"] = actions.append_scope(),     -- Insert at end of scope

                        ["r"] = actions.rename(),           -- Rename currently focused symbol

                        ["d"] = actions.delete(),           -- Delete scope

                        ["f"] = actions.fold_create(),      -- Create fold of current scope
                        ["F"] = actions.fold_delete(),      -- Delete fold of current scope

                        ["c"] = actions.comment(),          -- Comment out current scope

                        ["<enter>"] = actions.select(),     -- Goto selected symbol
                        ["o"] = actions.select(),

                        ["J"] = actions.move_down(),      -- Move focused node down
                        ["K"] = actions.move_up(),        -- Move focused node up

                        ["s"] = actions.toggle_preview(), -- Show preview of current node

                        ["<C-v>"] = actions.vsplit(),     -- Open selected node in a vertical split
                        ["<C-s>"] = actions.hsplit(),     -- Open selected node in a horizontal split

                        ["t"] = actions.telescope({       -- Fuzzy finder at current level.
                            layout_config = {             -- All options that can be
                                height = 0.60,            -- passed to telescope.nvim"s
                                width = 0.60,             -- default can be passed here.
                                prompt_position = "top",
                                preview_width = 0.50
                            },
                            layout_strategy = "horizontal"
                        }),

                        ["g?"] = actions.help(), -- Open mappings help window
                    },
                    lsp = {
                        auto_attach = false, -- If set to true, you don"t need to manually use attach function
                        preference = nil,    -- list of lsp server names in order of preference
                    },
                    source_buffer = {
                        follow_node = true, -- Keep the current node in focus on the source buffer
                        highlight = true,   -- Highlight the currently focused node
                        reorient = "smart", -- "smart", "top", "mid" or "none"
                        scrolloff = nil     -- scrolloff value when navbuddy is open
                    },
                    custom_hl_group = nil,  -- "Visual" or any other hl group to use instead of inverted colors
                })
            end
        },
        {
            "folke/neodev.nvim",
            opts = {
                library = {
                    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
                    runtime = true, -- runtime path
                    types = true,   -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
                    plugins = {
                        "nvim-treesitter",
                        "plenary.nvim",
                        "telescope.nvim",
                        "nvim-dap-ui"
                    },
                },
                setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
                override = nil,
                lspconfig = true,
                pathStrict = true,
            },
            lazy = false,
        },
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }


        local lsp = require("lspconfig")

        require("mason-lspconfig").setup({
            ensure_installed = require("languages.lsp"),
            automatic_installation = true,
            handlers = {
                function(server)
                    if server == "rust_analyzer" then -- if you're planning to use rust_analyzer and not rustaceanvim remove the if statement.
                        return
                    end

                    if server == "lua_ls" then
                        lsp[server].setup({
                            settings = {
                                Lua = {
                                    completion = {
                                        callSnippet = "Replace"
                                    }
                                }
                            }
                        })
                    end

                    lsp[server].setup({
                        on_attach = function(client, bufnr)
                            if client.server_capabilities.documentSymbolProvider then
                                return require("nvim-navic").attach(client, bufnr)
                            end
                        end,
                        capabilities = capabilities,
                    })
                end
            }
        })

        require("ufo").setup()
    end
}
