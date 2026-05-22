-- Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = buf, desc = "Show info"})
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {buffer = buf, desc = "Signature help"})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = buf, desc = "Go to definition"})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = buf, desc = "Go to declaration"})
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = buf, desc = "Go to references"})
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_flat, {buffer = buf, desc = "Show diagnostics"})
        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {buffer = buf, desc = "Recommended actions"})
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer = buf, desc = "Rename symbol"})
    end,
})

-- Languages

-- Python: pyright
vim.lsp.config("pyright", {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
})
vim.lsp.enable("pyright")
if vim.fn.executable("pyright-langserver") == 0 then
    vim.defer_fn(function()
        vim.notify("LSP: pyright-langserver not found", vim.log.levels.WARN)
    end, 0)
end

