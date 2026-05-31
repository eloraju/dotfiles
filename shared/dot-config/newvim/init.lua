require("config.options")
require("config.keymaps")
vim.pack.add({ "https://github.com/folke/lazy.nvim.git" })

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})

require("vim._core.ui2").enable({})
require("config.autocmds")
require("config.keymaps")
require("config.options")
-- load after lazy so plugins are available for autocommands and keymaps (and theme)
vim.cmd.colorscheme("tokyonight")
