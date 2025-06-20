return   {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      ensure_installed = { "vim", "lua", "query", "javascript", "ruby", "html", "typescript", "bash", "json" },
      highlight = { enable = true },
      indent = { enable = true},
    })
  end
}
