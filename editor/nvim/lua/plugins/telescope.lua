return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  },
  config = function()
    local builtin = require("telescope.builtin")
    require("telescope").load_extension("ui-select")
    vim.keymap.set('n', '<leader>t', builtin.find_files, {})
    vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  end
}
