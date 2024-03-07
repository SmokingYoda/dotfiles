vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      require("nvim-navic").attach(client, bufnr)
      require("nvim-navbuddy").attach(client, bufnr)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
}

require("lspconfig").lua_ls.setup({
  on_attach = function(client, bufnr)
    require("nvim-navbuddy").attach(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
