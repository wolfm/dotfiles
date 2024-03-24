require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "pyright", "vimls", "lua_ls", "tsserver" }
}

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = function(client, bufnr)
                local opts = { noremap=true, silent=true }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                -- vim.keymap.set('n', 'K', vim.lsp.buf.hover(nil, { border = "rounded" }))
                -- vim.keymap.set('n', 'K', vim.lsp.buf.hover(nil, { border = "rounded" }))
                vim.keymap.set('n', 'K', function()
                    local hover_opts = {
                        border = "rounded"  -- Specify rounded borders for the hover window
                    }
                    vim.lsp.buf.hover(nil, hover_opts)
                end, opts)
            end,
            handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
            },
        }
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}
