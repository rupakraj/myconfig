return {
    {
        'nvim-telescope/telescope.nvim',
        require = {
            { 'nvim-lua/plenary.nvim' }
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', builtin.find_files, { })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown { }
                    }
                }
            })
            require('telescope').load_extension('ui-select')
        end
    }
}

