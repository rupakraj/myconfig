return {
    {
        "hedyhli/outline.nvim",
        config = function()
            local commander = require("commander")
            commander.add({
                {
                    desc = "Toggle File outline",
                    cmd  = "<cmd>Outline<CR>",
                    keys = { "n", "<leader>ol"}
                },
            })

            require("outline").setup {
            }
        end,
    },
}
