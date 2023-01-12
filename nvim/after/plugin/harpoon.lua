local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file )
vim.keymap.set("n", "<leader>hu", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", ui.nav_prev)
vim.keymap.set("n", "<leader>k", ui.nav_next)
