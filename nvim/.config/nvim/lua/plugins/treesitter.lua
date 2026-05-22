-- This plugin is sadly deprecated.
-- nvim is gradually bundling parsers out-of-the-box.
-- When all of the languages below are supported out of the box,
-- this will no longer be necessary.
--
-- vim.api.nvim_create_autocmd('FileType', {
--     callback = function() pcall(vim.treesitter.start) end,
-- })

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "diff",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "ini",
                "json",
                "jsonc",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "toml",
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
