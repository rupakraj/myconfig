return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "jsonls",
                    "pyright",
                    "sqlls",
                    "bashls",
                    "cssls",
                    "html",
                    "clangd",
                    "texlab",
                    "marksman",
                    "jinja_lsp",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            -- "saghen/blink.cmp"
        },
        config = function()
            local lspconfig = require("lspconfig")
            -- local capabilities = require('blink.cmp').get_lsp_capabilities()
            -- capabilities.textDocument.codeLens = { dynamicRegistration = False }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- capabilities.textDocument.inlineCompletion = true

            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({capabilities = capabilities})
            lspconfig.jsonls.setup({capabilities = capabilities})
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.sqlls.setup({capabilities = capabilities})
            lspconfig.bashls.setup({capabilities = capabilities})
            lspconfig.cssls.setup({capabilities = capabilities})
            lspconfig.html.setup({capabilities = capabilities})
            lspconfig.clangd.setup({capabilities = capabilities})
            lspconfig.marksman.setup({capabilities = capabilities})
            lspconfig.jinja_lsp.setup({
                filetypes = { "html", "jinja", "jinja2", "djhtml", "htmldjango" },
                capabilities = capabilities,
            })
            --lspconfig.
            --vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            --vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
            --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
            --vim.keymap.set({'n','v'}, '<space>ca', vim.lsp.buf.code_action, {})
        end
    }
}
