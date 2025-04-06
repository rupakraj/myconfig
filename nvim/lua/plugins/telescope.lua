return {
    {
        'nvim-telescope/telescope.nvim',
        require = {
            { 'nvim-lua/plenary.nvim' }
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<C-p>', function()
                builtin.find_files({
                    cwd =  vim.fn.getcwd(-1),
                    previewer = false,
                })
            end,  { desc = 'Find files in the root directory' })

            vim.keymap.set('n', '<C-S-p>', builtin.commands, {desc = 'List all available commands in Telescope'})

            vim.keymap.set('n', '<leader>fg',  function()
                builtin.live_grep({ cwd =  vim.fn.getcwd(-1) })
            end,{ desc = 'Grep on the working directory' })

            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags)
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

