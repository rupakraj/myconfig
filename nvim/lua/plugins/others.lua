return {
    {
        "numToStr/Comment.nvim",
        config = function ()
            require("Comment").setup()
        end
    },

--     {
--         "andrewferrier/wrapping.nvim",
--         config = function()
--             require("wrapping").setup({
--                 auto_set_mode_filetype_allowlist = {
--                     "asciidoc",
--                     "gitcommit",
--                     "latex",
--                     "mail",
--                     "markdown",
--                     "rst",
--                     "tex",
--                     "text",
--                     "org",
--                 },
--             })
--
--             local commander = require("commander")
--             commander.add({
--                 {
--                     desc = "Line wrapping toggle (soft)",
--                     cmd  = ":SoftWrapMode<CR>",
--                     keys = { "n", "[ow"}
--                 },
--             })
--         end
--     }
}
