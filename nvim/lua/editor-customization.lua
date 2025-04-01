-- the following will clean all the trailing spaces of the file
-- remote all newlines except one
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Remove trailing spaces
    vim.cmd([[%s/\s\+$//e]])
    -- Ensure only one newline at EOF
    vim.cmd([[%s/\n\+\%$/\r/e]])
  end,
})

