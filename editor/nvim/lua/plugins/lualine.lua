return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_a = {
					{
						"filename",
						path = 1,
						shortening_target = 40,
					},
				},
			},
		})
	end,
}
