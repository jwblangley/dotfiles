-- Clear highlights on search when pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Map <C-s> to save all to prevent muscle memory being annoying
vim.keymap.set({"n", "i"}, "<C-s>", "<Esc><cmd>wall<CR>")
