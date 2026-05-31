return {
	"saghen/blink.cmp",
	dependencies = { "saghen/blink.lib" },
	build = function()
		require("blink-cmp").build():wait(60 * 1000)
	end,
	opts = {
		sources = {
			default = { "lsp", "buffer", "path", "lazydev" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		keymap = {
			preset = "none",
			["<C-Space>"] = { "show", "hide" },
			["<C-y>"] = { "accept", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
		},
		completion = {
			list = {
				selection = { preselect = false, auto_insert = false },
			},
		},
	},
}
