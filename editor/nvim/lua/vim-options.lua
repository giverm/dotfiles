-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Use bash for shell commands
vim.opt.shell = "bash"

-- Enable standar backspacing
vim.cmd("set backspace=indent,eol,start")

-- Display line numbers
vim.opt.number = true

-- Turn off wrapping
vim.opt.wrap = false

-- Use system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Line Guide
vim.cmd("set colorcolumn=80,120")

-- Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false

-- Disable backups and swaps
vim.opt.swapfile = false
vim.opt.backup = false

-- Keep indentation for new lines
vim.opt.autoindent = true

-- Copy relative filepath
vim.keymap.set('n', '<Leader>p', ':let @+=expand("%")<CR>', { remap = false })

-- Remap escape
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('v', 'nn', '<ESC>')

-- Clear search highlighting
vim.keymap.set('n', '<leader>', ':noh<CR>')

-- Remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "markdown" then
            vim.cmd([[%s/\s\+$//e]])
        end
    end,
})

-- :w or :W to save
vim.api.nvim_create_user_command("W", "w", { bang = true })

-- set default terminal
vim.opt.shell = "zsh"

-- remap exiting terminal to escape
vim.keymap.set('t', '<C-SPACE>', [[<C-\><C-n>]], { noremap = true, silent = true })
