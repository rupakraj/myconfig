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

-- vim.opts.rocks.enabled = false
vim.filetype.add({
    extension = {
        djhtml = "htmldjango",
    }
})
