-- Clear highlights on search when pressing <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Map <C-s> to save all to prevent muscle memory being annoying
vim.keymap.set({"n", "i"}, "<C-s>", "<Esc><cmd>wall<CR>")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- .cpp <-> .h shortcut
vim.keymap.set("n", "<leader>ch", function()
    local current = vim.api.nvim_buf_get_name(0)
    local target = current:gsub("%.cpp$", ".h")
    if target == current then
        target = current:gsub("%.h$", ".cpp")
    end
    if target == current then
        vim.notify("File is not .cpp or .h", vim.logl.levels.WARN)
        return
    end
    vim.cmd("edit " .. target)
end, { desc = "Toggle between .cpp and .h" })
