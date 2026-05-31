return {
	"folke/snacks.nvim",
	lazy = false,
	---@type snacks.Config
	opts = {
		---@class snacks.explorer.Config
		explorer = {
			enabled = true,
		},
		---@class snacks.lazygit.Config
		lazygit = { enabled = true },
	},
	keys = {
		-- Lazygit
		{
			"<leader>gg",
			function()
				Snacks.lazygit.open()
			end,
			desc = "Lazygit",
		},
		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer.open()
			end,
			desc = "Explorer",
		},
	},
}
