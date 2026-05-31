return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")

		vim.keymap.set("n", "<leader>ff", fzf.files)
		vim.keymap.set("n", "<leader>fk", fzf.keymaps)
		vim.keymap.set("n", "<leader>fh", fzf.helptags)
		--vim.keymap.set("n", "<leader>fH", !!helpgrep here!!)
		vim.keymap.set("n", "<leader>f.", fzf.resume)
		vim.keymap.set("n", "<leader>F", fzf.grep_project)

		vim.keymap.set("v", "<leader>F", fzf.grep_visual)
	end,
}
