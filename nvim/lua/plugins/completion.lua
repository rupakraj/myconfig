-- Completion Configuration examples
-- -- https://smarttech101.com/nvim-lsp-autocompletion-mapping-snippets-fuzzy-search
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            lspkind.init{}
            require("luasnip.loaders.from_vscode").lazy_load()

            vim.opt.completeopt = { "menu", "menuone", "noselect" }
            vim.opt.shortmess:append "c"

            cmp.setup {
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = lspkind.cmp_format(),
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping(
                        cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true
                        }, { "i", "c"}
                    ),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- for luasnip users.
                    { name = "buffer" },
                    { name = "path" },
                    -- { name = "cmdline" },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
            }
            cmp.setup.filetype({"sql"}, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" }
                }
            })
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
}
