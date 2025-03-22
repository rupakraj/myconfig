return {
    {
        -- https://github.com/rebelot/kanagawa.nvim 
        "rebelot/kanagawa.nvim",
        config = function ()
            require('kanagawa').setup({ })
            vim.cmd("colorscheme kanagawa-dragon")
        end
    },
--     {
--         "catppuccin/nvim",
--         lazy = false,
--         name = "catppuccin",
--         priority = 1000,
--         config = function()
--             require("catppuccin").setup({
--                 flavour = "mocha", -- latte, frappe, macchiato, mocha
--                 background = { -- :h background
--                     light = "latte",
--                     dark = "mocha",
--                 },
--                 color_overrides = {
--                     mocha ={
--                         base = "#1E1E2E",  -- Darker base background
--                         mantle = "#181825", -- Even darker
--                         crust = "#11111B",  -- Muted blacks
--                     }
--                 },
--                 integrations = {
--                     cmp = true,
--                     gitsigns = true,
--                     nvimtree = true,
--                     treesitter = true,
--                     notify = false,
--                     mini = {
--                         enabled = true,
--                         indentscope_color = "",
--                     },
--                 },
--             })
-- 
--             vim.cmd.colorscheme "catppuccin"
--             vim.cmd.background = "dark"
--         end
--     },
--     {
--         "ellisonleao/gruvbox.nvim",
--         config = function ()
--             require("gruvbox").setup({
--                 background = "dark",
--             })
-- 
--             vim.cmd("colorscheme gruvbox")
--         end
--     },
}
