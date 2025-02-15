return {
  {
    "folke/noice.nvim",
  },
  {
    "folke/snacks.nvim",
  },
  {
    "folke/flash.nvim",
  },
  {
    "folke/which-key.nvim",
  },
  {
    "folke/trouble.nvim",
  },
  { 
    "MunifTanjim/nui.nvim"
  },
  { 
    "rcarriga/nvim-notify"
  },
  { 
    "folke/todo-comments.nvim"
  },
  { 
    "folke/zen-mode.nvim" 
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
    { 
      "nvim-treesitter/nvim-treesitter-refactor" },
    { 
      "nvim-treesitter/nvim-treesitter-textobjects" },
    { 
      "nvim-treesitter/playground" },
    { 
      "nvim-treesitter/nvim-treesitter-context" },
    { 
      "theHamsta/nvim-treesitter-pairs" },
    { 
      "folke/twilight.nvim",                        config = true },
    { 
      "windwp/nvim-ts-autotag" },
    { 
      "ziontee113/syntax-tree-surfer" },
    { 
      "andymass/vim-matchup" },
    { 
      "theHamsta/nvim-dap-virtual-text" },
    { 
      "mfussenegger/nvim-treehopper" },
    { 
      "drybalka/tree-climber.nvim" },
    { 
      "onsails/lspkind.nvim" },
    { 
      "williamboman/mason.nvim" },
    { 
      "williamboman/mason-lspconfig.nvim" },
    { 
      "neovim/nvim-lspconfig" },
    { 
      "hrsh7th/cmp-nvim-lsp" },
    { 
      "petertriho/cmp-git" },
    { 
      "hrsh7th/nvim-cmp" },
    { 
      "hrsh7th/cmp-buffer" },
    { 
      "hrsh7th/cmp-path" },
    { 
      "hrsh7th/cmp-cmdline" },
    { 
      "hrsh7th/cmp-vsnip" },
    { 
      "hrsh7th/vim-vsnip" },
    { 
      "rafamadriz/friendly-snippets" },
    { 
      "nvim-tree/nvim-web-devicons" },
    { 
      "nvim-lua/plenary.nvim" },
    { 
      "nvim-telescope/telescope.nvim" },
    { 
      "BurntSushi/ripgrep" },
    { 
      "sharkdp/fd" },
    { 
      "lewis6991/gitsigns.nvim" },
    { 
      "nvim-lualine/lualine.nvim" },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
    },
    {
      "stevearc/conform.nvim",
      opts = {
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
        },
      },
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
    },
    { "rcarriga/nvim-dap-ui" },
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
    { "numToStr/Comment.nvim" },
    {
      "catppuccin/nvim",
      name = "cattppuccin",
      priority = 1000,
    },
    { "MunifTanjim/nui.nvim" },
    { "3rd/image.nvim" },
    {
      "nvim-neo-tree/neo-tree.nvim",
      lazy = false,
      branch = "v3.x",
    },
    {
      "akinsho/bufferline.nvim",
      version = "*",
    },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          {
            path = "${3rd}/luv/library",
            words = { "vim%.uv" },
          },
        },
      },
    },
    { "RRethy/vim-illuminate" },
    { "MeanderingProgrammer/render-markdown.nvim" },
    { "SmiteshP/nvim-navic" },
    { "sindrets/diffview.nvim" },
    { "NeogitOrg/neogit" },
    {
      "catgoose/nvim-colorizer.lua",
      event = "BufReadPre",
    },
    {
      "epwalsh/obsidian.nvim",
      version = "*",
      ft = "markdown",
    },
    {
      "mrcjkb/rustaceanvim",
      lazy = false,
      version = "^5",
    }
  }
