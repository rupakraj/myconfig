return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        -- vim.opt.termguicolors = true
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
                close_icon = '  ',
                separator_style = "thick", -- Other styles: "slant", "thick", "thin", "padded_slant"
                offsets = {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "left",
                }
            },
        }
    end
}
