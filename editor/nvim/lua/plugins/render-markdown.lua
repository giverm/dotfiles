return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  keys = {
    { '<leader>m', '<cmd>RenderMarkdown toggle<cr>', desc = 'Render Markdown Toggle' },
    { '<leader>mp', '<cmd>RenderMarkdown preview<cr>', desc = 'Render Markdown preview' },
  },
}
