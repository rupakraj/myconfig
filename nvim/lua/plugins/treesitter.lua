return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            --ensure_installed = {"c", "lua", "vim", "markdown", "markdown_inline", "python", "html", "css", "javascript", "cpp", "make", "html", "css", "javascript", "cpp", "sql", "scss", "jinja","jinja_inline", "json", "json5", "tsv", "csv", "xml", "yaml", "latex"},
            highlight = { enable = true },
            indent    = { enable = true },
        })
    end
}

