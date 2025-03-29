return {
    "FeiyouG/commander.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("commander").setup({
            components = { "DESC", "KEYS", "CMD", "CAT" },
            sort_by = { "DESC", "CAT", "KEYS", "CMD" },

            auto_replace_desc_with_cmd = true,
            prompt_title = "  Commands",

            integration = {
                telescope = {
                    enable = true,
                    -- theme  = require("telescope.themes").commander,
                },
                lazy = {
                    enable = true,
                    set_plugin_name_as_cat = true,
                }
            }
        })
        vim.keymap.set('n', '<C-S-p>', '<CMD>Telescope commander<CR>', {})
        vim.keymap.set('v', '<C-S-p>', '<CMD>Telescope commander<CR>', {})
        vim.keymap.set('i', '<C-S-p>', '<CMD>Telescope commander<CR>', {})
    end
}

