local cmp = require("cmp")

cmp.setup({
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol",
      maxwidth = {
        menu = 50,
        abbr = 50,
      },
      ellipsis_char = "...",
      show_labelDetails = true,
      before = function(_, vim_item)
        return vim_item
      end
    })
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert(),
  sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "vsnip" }, { name = "lazydev", group_index = 0 } },
    { { name = "buffer" } }),
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({ { name = 'git' } }, { { name = 'buffer' } })
})

require("cmp_git").setup()

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "omnisharp",
    "ast_grep",
    "bashls",
    "cmake",
    "dockerls",
    "biome",
    "marksman",
    "pylsp",
    "vimls",
    "harper_ls",
    "powershell_es",
  },
  automatic_installation = true,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  },
})
