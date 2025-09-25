return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  keys = {
    { "<leader>fm", function() require("conform").format({ async = true }) end, desc = "Format file" },
  },

  config = function()
   require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      json = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      sh = { "shfmt" },
      ruby = { "rubocop" },
      },
    })
  end,
}
