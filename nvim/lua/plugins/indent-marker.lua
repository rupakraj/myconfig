return {
    {
        "nvimdev/indentmini.nvim",
        config = function()
        -- Colors are applied automatically based on user-defined highlight groups.
        -- There is no default value.
        vim.cmd.highlight('IndentLine guifg=#273746')
        -- Current indent line highlight
        vim.cmd.highlight('IndentLineCurrent guifg=#6E2C00')
            require("indentmini").setup({
                -- only_current = true,
                char = "│",
            })
        end
    },
}
