local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo(
            {
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out,                            "WarningMsg" },
                { "\nPress any key to exit..." },
            },
            true,
            {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("neovide")
require("vim-options")

require("lazy").setup("plugins")

-- additional lua scritps
require("code-navigation")
require("editor-customization")

-- sursa ai test
-- require("sursa-ai-assist")
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, { desc = "Run CodeLens" })

-- snippet setup
require("snippets/tex")
-- require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })


-- custom functions
require("paste-image")
vim.keymap.set("n", "<leader>pi",
    function()
        paste_image()
    end,
    { desc = "Paste clipboard image and insert includegraphics" }
)

