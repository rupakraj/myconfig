return {
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = function()
            require("commander").add({
                {
                    desc = "Diagnostics (Trouble)",
                    cmd  = ":Trouble diagnostics toggle<cr>",
                    keys = { "n", "<leader>xx" },
                },
                {
                    desc = "Buffer Diagnostics (Trouble)",
                    cmd  = ":Trouble diagnostics toggle filter.buf=0<cr>",
                    keys = { "n", "<leader>xX" },
                },
                {
                    desc = "Symbols (Trouble)",
                    cmd  = ":Trouble symbols toggle focus=false<cr>",
                    keys = { "n", "<leader>cs" },
                },
                {
                    desc = "LSP Definitions / references / ... (Trouble)",
                    cmd  = ":Trouble lsp toggle focus=false win.position=right<cr>",
                    keys = { "n", "<leader>cl" },
                },
                {
                    desc = "Location List (Trouble)",
                    cmd  = ":Trouble loclist toggle<cr>",
                    keys = { "n", "<leader>xL" },
                },
                {
                    desc = "Quickfix List (Trouble)",
                    cmd  = ":Trouble qflist toggle<cr>",
                    keys = { "n", "<leader>xQ" },
                },
            })
            require("trouble").setup()
        end
    },
}
