vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`Z");
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "n", "nzzzv");
vim.keymap.set("n", "N", "Nzzzv");

vim.keymap.set("x","<leader>p","\"_dP")


-- system clipboard
vim.keymap.set("n","<leader>y","\"+y")
vim.keymap.set("v","<leader>y","\"+y")
vim.keymap.set("n","<leader>Y","\"+Y")

vim.keymap.set("n","<leader>d","\"_d")
vim.keymap.set("v","<leader>d","\"_d")

-- disable Q (repeat last register # times)
vim.keymap.set("n", "Q", "<nop>")

-- replace all occurances of word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executabel
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- splits
vim.keymap.set("n","<C-s>j","<cmd>split<CR><C-w>j")
vim.keymap.set("n","<C-s>l","<cmd>vsplit<CR><C-w>l")
