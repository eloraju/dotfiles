-- "self explanatory" opts
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.winborder = "rounded"

-- opts that need some calirification
-- search will ignore case if only lowercase chars are used
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- share clipboard with OS
vim.opt.clipboard = "unnamedplus"
-- CursorHold autocommand trigger wait time in ms (also autosave to swapfile timeout)
vim.opt.updatetime = 250
-- wait time for mapped sequences
vim.opt.timeoutlen = 500
-- visualise nbsp and whitespace at the start of lines
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- show all occurances in a split window when using < / > and < : >
vim.opt.inccommand = "split"
-- minimum number of lines below/above cursor
vim.opt.scrolloff = 10
-- highlight all search results
vim.opt.hlsearch = true
-- idententation depth in spaces
vim.opt.shiftwidth = 2
-- use <Tab> and <Space> when pressing <Tab> (tabstop = 8)
-- <Tab> ==> ..
-- <Tab><Tab> ==> ....
-- <Tab><Tab><Tab><Tab> ==> <Tab>
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- plugins
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.cmd("colorscheme vscode")

require "mason".setup()
require "oil".setup()
require "nvim-tree".setup()
require "blink.cmp".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "typescript", "lua" },
	highlight = { enable = true }
})

vim.lsp.enable({
	"lua_ls",
	"emmet_ls",
	"ts_ls",
	"eslint"
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

-- keymaps
local map = vim.keymap.set
vim.g.mapleader = " "

require "gitsigns".setup({
	on_attach = function(bufnr)
		local gitsigns = require "gitsigns"
		local function gsmap(mode, keys, action, opts)
			opts = opts or {}
			opts.buffer = bufnr
			map(mode, keys, action, opts)
		end

		gsmap("n", "<leader>gh", gitsigns.preview_hunk)
		gsmap("n", "<leader>ghi", gitsigns.preview_hunk_inline)
		gsmap("n", "<leader>gs", gitsigns.stage_hunk)
		gsmap("n", "<leader>gr", gitsigns.reset_hunk)
		gsmap("n", "<leader>gd", gitsigns.diffthis)
	end
})

map("n", "<leader>so", ":update<CR> :source<CR>")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-q>", ":bdelete<CR>")

map("n", "<C-s>h", ":set nosplitright<CR>:vsplit<CR>")
map("n", "<C-s>j", ":set splitbelow<CR>:split<CR>")
map("n", "<C-s>k", ":set nosplitbelow<CR>:split<CR>")
map("n", "<C-s>l", ":set splitright<CR>:vsplit<CR>")

map("n", "<Esc>", ":noh<CR>")

map({ "n", "v", "x" }, "<leader>y", '"+y')
map({ "n", "v", "x" }, "<leader>d", '"+d')

map("n", "<leader>pf", ":Telescope find_files<CR>")
map("n", "<leader>ph", ":Telescope help_tags<CR>")
map("n", "<leader>pb", ":Telescope buffers<CR>")
map("n", "<leader>ps", ":Telescope lsp_dynamic_workspace_symbols<CR>")
map("n", "<leader>pg", ":Telescope live_grep<CR>")

map("n", "<leader>e", ":Oil<CR>")
map("n", "<C-b>", ":NvimTreeFindFileToggle<CR>")

map("n", "<leader>ff", vim.lsp.buf.format)
map("n", "<C-space>", vim.lsp.buf.code_action)
map("n", "<leader>d", vim.diagnostic.open_float)
