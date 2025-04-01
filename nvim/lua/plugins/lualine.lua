return {
     {
         "nvim-lualine/lualine.nvim",
         config = function()
             require('lualine').setup({
                 options = {
                     theme = 'dracula',
                     -- theme = 'gruvbox_dark',
                     icons_enabled = true,
                     -- always_show_tabline = true,
                     extensions = { "neo-tree" },
                     disabled_filetypes = { 'neo-tree','Outline' },
                 }
             })
         end
     },
}

