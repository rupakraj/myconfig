-- code navigation
vim.api.nvim_set_keymap('n', '<S-Left>', 'v<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Right>', 'v<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Up>', 'v<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', 'v<Down>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<S-Left>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', '<Down>', { noremap = true, silent = true })

-- selections
vim.api.nvim_set_keymap('n', '<C-S-Left>', 'v<Left>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', 'v<Right>e', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<C-S-Left>', '<Left>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-Right>', '<Right>e', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S-Home>', 'vgg', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-End>', 'vG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-Home>', 'gg', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-End>', 'G', { noremap = true, silent = true })

-- copy paste and undo
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true }) -- Copy
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true }) -- Copy in visual mode
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true }) -- Paste
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true }) -- Paste in insert mode

vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true }) -- Undo
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>u', { noremap = true, silent = true }) -- Undo in insert mode
vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', { noremap = true, silent = true }) -- Redo

vim.keymap.set({'n','v','i'}, '<C-s>', ':w<CR>', { })

