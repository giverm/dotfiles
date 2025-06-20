return {
  "dense-analysis/ale",
  config = function()
    local g = vim.g
    local b = vim.b

    g.ale_ruby_rubocop_auto_correct_all = 1

    g.ale_linters = {
        ruby = { "rubocop", "ruby" },
        lua = { "lua_language_server" },
        javascript = { "prettier", "eslint" },
        shell = { "shellcheck", "shfmt" },
    }
    b.ale_fixers = {
        ruby = { "rubocop", "ruby"  },
        lua = { "lua_format"  },
        javascript = { "prettier", "eslint" },
        shell = { "shfmt" },
    }

    g.ale_sign_error = "!!"
    g.ale_sign_warning = "!"

    g.ale_echo_msg_format = "[%linter%] %code %s"
    g.ale_echo_msg_error_str = "Error"
    g.ale_echo_msg_warning_str = "Warning"
    g.ale_echo_msg_info_str = "Info"

    b.ale_fix_on_save = 1
  end
}
