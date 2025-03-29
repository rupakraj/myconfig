---- return {
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
        "hrsh7th/cmp-nvim-lsp"
    },
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
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<c-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<c-f>"] = cmp.mapping.scroll_docs(4),
                    ["<c-space>"] = cmp.mapping.complete(),
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                        { name = "nvim_lsp" },
                        { name = "luasnip" }, -- for luasnip users.
                    }, {
                    { name = "buffer" },
                }),
            })
            cmp.setup.filetype({"sql"}, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" }
                }
            })
        end,
    },
}

