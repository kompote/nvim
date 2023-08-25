require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "clangd"}
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    -- vim.keymap.set('n', 'ge', require('telescope.builtin').lsp_incoming_calls, {})
    -- vim.keymap.set('n', 'go', require('telescope.builtin').lsp_outgoing_calls, {})
    -- vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
