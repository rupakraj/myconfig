return {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
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

        -- vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal toggle<CR>', {})

        -- register the commands
        local commander = require("commander")
        commander.add({
            {
                desc = "Neotree toggle",
                cmd  = ":Neotree filesystem reveal toggle<CR>",
                keys = { "n", "<C-b>"}
            },
            {
                desc = "Neotree show buffer",
                cmd  = ":Neotree buffers toggle<CR>"
            },
            {
                desc = "Neotree float",
                cmd  = ":Neotree float on screen<CR>"
            },
            {
                desc = "Neotree git status toggle",
                cmd  = ":Neotree git_status toggle<CR>"
            },
            {
                desc = "Neotree Show LSP Symbols  toggle",
                cmd  = ":Neotree document_symbols toggle<CR>"
            }

        })
    end
}

