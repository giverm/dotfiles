return {
  { "github/copilot.vim", lazy = false }, -- or zbirenbaum/copilot.lua
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", "<cmd>CopilotChat<cr>", mode = "n", desc = "CopilotChat: Open chat" },
      { "<leader>ze", "<cmd>CopilotChatExplain<cr>", mode = "v",  desc = "CopilotChat: Explain code" },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
