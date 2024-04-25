return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-calc",
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            opts = {
                disable_filetype = {
                    "TelescopePrompt",
                    "spectre_panel"
                },
                disable_in_macro = true,        -- disable when recording or executing a macro
                disable_in_visualblock = false, -- disable when insert after visual block mode
                disable_in_replace_mode = true,
                ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
                enable_moveright = true,
                enable_afterquote = true,         -- add bracket pairs after quote
                enable_check_bracket_line = true, --- check bracket in same line
                enable_bracket_in_quote = true,   --
                enable_abbr = false,              -- trigger abbreviation
                break_undo = true,
                check_ts = true,
                map_cr = true,
                map_bs = true,
                map_c_h = false,
                map_c_w = false,
            },
            lazy = false,
        },
    },
    config = function()
        local cmp = require("cmp")
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local lspkind = require('lspkind')

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',          -- show only symbol annotations
                    maxwidth = 50,            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    before = function(_, vim_item)
                        return vim_item
                    end
                })
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior
                        .Insert
                }),
                ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<Up>"] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior
                        .Insert
                }),
                ["<Esc>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp",
                    entry_filter = function(entry)
                        return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
                    end
                },
                { name = "luasnip" },
                { name = "calc" },
            }, {
                { name = "buffer" }
            })
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({ { name = "git" } }, { { name = "buffer" } })
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } }
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end,
    lazy = false,
}
