-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 750

-- Use line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent (wrapped lines are equally indented as their origin)
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching unless \C or capitals in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Default new splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live
vim.o.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 10

-- Add confirmation dialog to potentially destructive actions
vim.o.confirm = true

-- Use spaces instead of tabs, default to 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftround = true

-- Show matching brackets when creating them
vim.opt.showmatch = true

-- Keep line indentation when wrapping lines
vim.opt.linebreak = true

-- Ensure posix trailing new line
vim.opt.fixeol = true

-- Remove plugin language providers (add back when needed)
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Check for external changes to file
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter", "CursorHold" ,"CursorHoldI"}, {
    pattern = "*",
    command = [[checktime]]
})

-- Prevent new lines after comments still being comments
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufWinEnter", "FileType", "BufEnter"}, {
    pattern = "*",
    command = [[set formatoptions-=r]]
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufWinEnter", "FileType", "BufEnter"}, {
    pattern = "*",
    command = [[set formatoptions-=o]]
})

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

-- Plugin manager
require("lazy-config")

-- Keymaps
require("keymaps")

