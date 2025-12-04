return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
                "vimdoc"
            },
            sync_install = false,
            auto_install = true,
            ignore_install = { },
            highlight = {
                enable = true
            }
        })
    end
}
