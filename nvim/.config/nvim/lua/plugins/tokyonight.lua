return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_highlights = function(highlights, colors)
            highlights.WinSeparator = { fg = colors.blue }
            highlights.StatusLine = { sp = colors.blue, underline = true }
            highlights.StatusLineNC = { sp = colors.blue, underline = true }
        end,
    },
}
