return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd   = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft    = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'Thiago4532/mdmath.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        opts = {}

        -- The build is already done by default in lazy.nvim, so you don't need
        -- the next line, but you can use the command `:MdMath build` to rebuild
        -- if the build fails for some reason.
        -- build = ':MdMath build'
    },
}
