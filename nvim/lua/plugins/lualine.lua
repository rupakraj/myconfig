return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup({
            options = {
                theme = 'dracula',
                icons_enabled = true,
                always_show_tabline = true,
            }
        })
    end
}

