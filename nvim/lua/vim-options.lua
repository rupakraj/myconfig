-- General otions for the vim
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.cmd("set mouse=a")
vim.cmd("set number")
vim.cmd("set cursorline")

-- wrapping
vim.cmd("set wrap")
vim.cmd("set linebreak")
vim.cmd("set breakindent")
vim.cmd("set textwidth=80")

-- vim options
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true


-- clipboard share with OS
vim.opt.clipboard = "unnamedplus"

-- experimental font
-- vim.opt.guifont = "DejaVu Sans Mono:h12"
-- experimental ends


-- git
vim.g.signcolumn="yes"


-- vim.opts.rocks.enabled = false
vim.filetype.add({
    extension = {
        djhtml = "htmldjango",
    }
})
