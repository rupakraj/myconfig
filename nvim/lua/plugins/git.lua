return {
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require("gitsigns").setup()
        end
    },
    {
        'tpope/vim-fugitive',
        -- config = function()
        --     local git = require("fugitive")
        --     git.setup({})
        -- end
    }
}
