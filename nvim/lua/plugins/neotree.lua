return {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },

    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = '',
                [vim.diagnostic.severity.WARN] = '',
                [vim.diagnostic.severity.INFO] = '',
                [vim.diagnostic.severity.HINT] = '󰌵',
            },
        }
    }),

    config = function()
        require('neo-tree').setup {
            enable_git_status = true,
            enable_diagnostics = true,

            default_component_configs = {
                indent = {
                    indent_size = 3,
                    with_markers = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                    highlight = "NeoTreeIndentMarker",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "✖", -- this can only be used in the git_status source
                        renamed = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "󰄱",
                        staged = "",
                        conflict = "",
                    },
                },
            },

            filesystem = {
                filtered_items = {
                    visible = false, -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_hidden = true, -- only works on Windows for hidden files/directories
                    hide_by_name = {
                        "node_modules",
                    },
                    hide_by_pattern = { -- uses glob style patterns
                        "*.meta",
                        "*/src/*/tsconfig.json",
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                        ".gitignore",
                    },
                    always_show_by_pattern = { -- uses glob style patterns
                    --".env*",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        ".DS_Store",
                        "thumbs.db"
                    },
                    never_show_by_pattern = { -- uses glob style patterns
                        ".null-ls_*",
                    },
                },
            },

            window = {
                position = "right",
                width = 40,
            },
            source_selector = {
                winbar = true,
                statusline = false
            }
        }

        -- vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal toggle<CR>', {})

        -- register the commands
        local commander = require("commander")
        commander.add({
            {
                desc = "Neotree toggle",
                cmd  = ":Neotree reveal right toggle<CR>",
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

