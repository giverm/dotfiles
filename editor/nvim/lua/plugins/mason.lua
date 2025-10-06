return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ruby_lsp",
				"rubocop",
				"prettierd",
				"ts_ls",
			},
		},
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
}
