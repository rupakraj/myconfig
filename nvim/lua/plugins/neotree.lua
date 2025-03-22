return {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal toggle<CR>', {})
        require('neo-tree').setup {
            enable_git_status = true,
            enable_diagnostics = true,
            indent = {
                indent_size = 3,
                with_markers = false,
            },
            window = {
                position = "left"
            }
        }
    end
}

