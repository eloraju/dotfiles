return {
	{ "mason-org/mason.nvim", opts = { firewall = { enabled = true } } },
	{ "neovim/nvim-lspconfig" },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
        "lua_ls",
        "vim_ls",
        "yamlls",
        "vstsls",
        "prettierd",
        "eslintd",
        "json-lsp",
        "zls",
        "stylua",
        "shfmt",
      },
		},
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"folke/lazydev.nvim",
		opts = {
			library = {
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},
}
