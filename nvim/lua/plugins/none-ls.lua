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

        vim.keymap.set('n', "<leader>gf", vim.lsp.buf.format, {})
    end
}

