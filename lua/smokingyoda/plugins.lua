local plugins = {}

-- Comment un-needed plugins and run :PlugClean

plugins.getPlugins = function (Plug)
	Plug("3rd/image.nvim")							-- Dependency for noice
	Plug("L3MON4D3/LuaSnip")						-- Snipping engine
	Plug("Mofiqul/dracula.nvim")					-- Theme
	Plug("MunifTanjim/nui.nvim")					-- Dependency for noice
	Plug("aaronhallaert/advanced-git-search.nvim")
	Plug("folke/neodev.nvim")						-- Completion for Neovim API
	Plug("folke/noice.nvim")						-- Main UI
	Plug("folke/persistence.nvim")
	Plug("folke/todo-comments.nvim")				-- TODO coloroing and motion
	Plug("folke/trouble.nvim")						-- For debugging
	Plug("folke/which-key.nvim")					-- Shows mapped keys.
	Plug("github/copilot.vim")
	Plug("goolord/alpha-nvim")						-- Dashboard
	Plug("hrsh7th/cmp-buffer")						-- Dependency for CMP
	Plug("hrsh7th/cmp-cmdline")						-- Dependency for CMP
	Plug("hrsh7th/cmp-nvim-lsp")					-- Dependency for CMP
	Plug("hrsh7th/cmp-path")						-- Dependency for CMP
	Plug("hrsh7th/nvim-cmp")						-- Completion plugin
	Plug("j-hui/fidget.nvim")						-- UI plugin
	Plug("lukas-reineke/indent-blankline.nvim")		-- UI plugin
	Plug("mfussenegger/nvim-dap")					-- Debuggin plugin
	Plug("natecraddock/sessions.nvim")
	Plug("natecraddock/workspaces.nvim")
	Plug("neovim/nvim-lspconfig")					-- LSP
	Plug("numToStr/Comment.nvim")					-- Commenting plugin
	Plug("nvim-lua/plenary.nvim")					-- Dependency
	Plug("nvim-lualine/lualine.nvim")				-- UI plugin
	Plug("nvim-telescope/telescope.nvim")			-- Fuzzy finder
	Plug("nvim-tree/nvim-web-devicons")				-- Dependency
	Plug("nvim-treesitter/nvim-treesitter")			-- Syntax
	Plug("rafamadriz/friendly-snippets")			-- Snippets
	Plug("rcarriga/nvim-dap-ui")					-- Debuggin UI plugin
	Plug("rcarriga/nvim-notify")					-- Dependency for noice
	Plug("saadparwaiz1/cmp_luasnip")				-- Dependency for CMP
	Plug("soulis-1256/eagle.nvim")
	Plug("stevearc/dressing.nvim")					-- UI plugin
	Plug("tpope/vim-fugitive")
	Plug("windwp/nvim-autopairs")					-- Auto-pairing
	Plug("ziglang/zig.vim")							-- Zig language support	
end

return plugins
