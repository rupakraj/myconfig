-- Completion Configuration examples
-- -- https://smarttech101.com/nvim-lsp-autocompletion-mapping-snippets-fuzzy-search
--
-- return {
--    {
--        'saghen/blink.cmp',
--        dependencies = 'rafamadriz/friendly-snippets',
--        version = '*',
--        opts = {
--            keymap = { preset = 'default' },
--
--            appearance = {
--                 use_nvim_cmp_as_default = true,
--                nerd_font_variant = 'mono'
--            },
--            sources = {
--                default = { 'lsp', 'path', 'snippets', 'buffer' },
--            },
--            fuzzy = { implementation = "prefer_rust_with_warning" }
--        },
--        opts_extend = { "sources.default" }
--    },
--}


return {
    {
        "l3mon4d3/luasnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        build = "make install_jsregexp",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = lspkind.cmp_format(),
                },
                mapping = {
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- for luasnip users.
                    { name = "buffer" },
                    { name = "path" },
                    { name = "cmdline" },
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

