return {
    'nvimtools/none-ls.nvim',

    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },

    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            source = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            }
        })

        -- vim.keymap.set('n', "<leader>gf", vim.lsp.buf.format, {})
        -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

        -- register the commands
        require("commander").add({
            {
                desc = "Format whole buffer",
                cmd  = function() vim.lsp.buf.format() end,
                keys = {
                    {"n", "<leader>gf"},
                }
            },
            {
                desc = "Rename within the buffer",
                cmd  = function() vim.lsp.buf.rename() end,
                keys = {
                    {"n", "<leader>rn"},
                }
            },

        })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

    end,
}

