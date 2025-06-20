return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
    require("lualine").setup {
      options = {
        theme = 'dracula'
      },
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
            shortening_target = 40,
          },
        },
      },
    }
    end
}
