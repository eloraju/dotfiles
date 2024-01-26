vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.wrap = false

-- no auto backups
vim.opt.swapfile = false
vim.opt.backup = false

-- long running undo history :)
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true;

vim.opt.incsearch = true

vim.opt.termguicolors = true

-- alaways show at least 8 rows
vim.opt.scrolloff = 8

vim.opt.updatetime = 50

-- maybe use a function to determine when to use this
-- it's just a highlighted column at the 80 char mark
-- very useful e.g. with markup
--vim.opt.colorcolumn = "80"

