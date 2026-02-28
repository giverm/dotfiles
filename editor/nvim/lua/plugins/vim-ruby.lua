return {
	"vim-ruby/vim-ruby",
	config = function()
		-- Remove '.' from indentkeys to prevent re-indenting on dot
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "ruby",
			callback = function()
				vim.opt_local.indentkeys:remove(".")
			end,
		})
	end,
}
