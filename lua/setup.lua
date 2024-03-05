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

  require("luasnip.loaders.from_vscode").lazy_load()

  require("neodev").setup({
    library = { plugins = { "nvim-dap-ui", "neotest" }, types = true }
  })

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

  if M.use_telescope then
    require('telescope').setup()
    require("telescope").load_extension("scope")
    require("telescope").load_extension("notify")
    require("telescope").load_extension("projects")
  end

  require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
  })

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

  require("lspconfig").lua_ls.setup({
    on_attach = function(client, bufnr)
      require("nvim-navic").attach(client, bufnr)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = { Lua = { completion = { callSnippet = "Replace" } } }
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
      border = "single",
      position = "top"
    }
  })
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
  require("neotest").setup({
    adapters = {
      require("neotest-rust"),
      require("neotest-vim-test"),
    }
  })
end
M.setup_ui = function()
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
  require("alpha").setup(require("alpha.themes.theta").config)
  require("lualine").setup({
    options = { theme = "tokyonight" }
  })

  if M.settings.use_bufferline then
    require("bufferline").setup()
  end

  if M.settings.use_scope then
    require("scope").setup()
  end

  local highlight = {
    "Black",
    "Red",
    "Green",
    "Yellow",
    "Blue",
    "Violet",
    "LightBlue",
  }
  local hooks = require "ibl.hooks"

  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Black", { fg = "#15161e" })
    vim.api.nvim_set_hl(0, "Red", { fg = "#f7768e" })
    vim.api.nvim_set_hl(0, "Green", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "Yellow", { fg = "#e0af68" })
    vim.api.nvim_set_hl(0, "Blue", { fg = "#7aa2f7" })
    vim.api.nvim_set_hl(0, "Violet", { fg = "#bb9af7" })
    vim.api.nvim_set_hl(0, "LightBlue", { fg = "#7dcfff" })
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }

  require("ibl").setup { scope = { highlight = highlight } }

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
