vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", ":nohl<CR>")
-- create a function that handles this splitting nonsense.
-- also, this should open a fzf in the opened split
vim.keymap.set("n", "<C-w><C-h>", ":set nospr<CR>:vsplit<CR>")
vim.keymap.set("n", "<C-w><C-j>", ":set sb<CR>:split<CR>")
vim.keymap.set("n", "<C-w><C-k>", ":set nosb<CR>:split<CR>")
vim.keymap.set("n", "<C-w><C-l>", ":set spr<CR>:vsplit<CR>")
-- add "Open definition in split <HJKL>" 

