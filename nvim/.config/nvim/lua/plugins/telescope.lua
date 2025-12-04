return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--hidden",
                    "--ignore-file=" .. vim.env.HOME .. "/.rgignore",
                    "--smart-case",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column"
                }
            },
            pickers = {
                find_files = {
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--ignore-file=" .. vim.env.HOME .. "/.rgignore"
                    },
                },
            },
        })
    end
}
