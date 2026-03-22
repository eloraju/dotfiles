-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Cancel highlighting after search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Make ctrl-[u,d] center cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up half a screen and center cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down half a screen and center cursor' })

-- Muscle memory keymaps for splitting
local utils = require 'eloraju.utils'
vim.keymap.set('n', '<C-s>h', utils.split 'h', { desc = 'Open new window to left of current' })
vim.keymap.set('n', '<C-s>j', utils.split 'j', { desc = 'Open new window below of current' })
vim.keymap.set('n', '<C-s>k', utils.split 'k', { desc = 'Open new window above of current' })
vim.keymap.set('n', '<C-s>l', utils.split 'l', { desc = 'Open new window to right of current' })
