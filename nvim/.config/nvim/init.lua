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

-- Enable signcolumn (e.g. git +/- symbols)
vim.o.signcolumn = "yes"

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

-- Keep line indentatino on new line
vim.opt.linebreak = true

-- Ensure posix trailing new line
vim.opt.fixeol = true

-- Keymaps
require("keymaps")
