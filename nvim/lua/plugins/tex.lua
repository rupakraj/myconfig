return {
    {
        "lervag/vimtex",
        lazy = false,
        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_latexmk = {
                out_dir = "output",
                build_dir = "build",
                callback = 1,
                continuous = 1,
                executable = "latexmk",
                options = {
                    "-lualatex",
                    "-interaction=nonstopmode",
                    "-shell-escape",
                    "-outdir=output",
                    "-auxdir=build",
                },
            }
        end
    }
}
