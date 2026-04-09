vim.pack.add({
	"https://www.github.com/nvim-tree/nvim-web-devicons",
	"https://www.github.com/nvim-mini/mini.nvim",
	"https://www.github.com/folke/snacks.nvim",
	"https://www.github.com/stevearc/oil.nvim",
	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	{
		src = "https://www.github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	-- Language Server Protocols
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://www.github.com/mason-org/mason.nvim",
})
