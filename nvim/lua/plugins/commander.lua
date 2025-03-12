return {
    "FeiyouG/commander.nvim",
    dependencies = { 
        "nvim-telescope/telescope.nvim" 
    },
    config = function()
        require("commander").setup({
            components = { "DESC", "KEYS", "CAT" },
            sort_by = { "DESC", "KEYS", "CAT", "CMD" },
            integration = {
                telescope = {
                    enable = true,
                },
                lazy = {
                    enable = true
                }
            }
        })
        vim.keymap.set('n', '<C-S-p>', '<CMD>Telescope commander<CR>', {})
   end
}

