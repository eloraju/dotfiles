local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"lua_ls",
	"rust_analyzer"
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-Enter>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I"
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	if client.name == "eslint" then
		vim.cmd.LspStop("eslint")
	end

	vim.keymap.set("n", "gd",  vim.lsp.buf.definition , opts)
	vim.keymap.set("n", "K",  vim.lsp.buf.hover , opts)
	vim.keymap.set("n", "<leader>kss",  vim.lsp.buf.workspace_symbol , opts)
	vim.keymap.set("n", "<leader>kd",  vim.diagnostic.open_float , opts)
	vim.keymap.set("n", "<leader>dn",  vim.diagnostic.goto_next , opts)
	vim.keymap.set("n", "<leader>dp",  vim.diagnostic.goto_prev , opts)
	vim.keymap.set("n", "<leader>ka",  vim.lsp.buf.code_action , opts)
	vim.keymap.set("n", "<leader>kr",  vim.lsp.buf.references , opts)
  vim.keymap.set("n", "<leader>krn",  vim.lsp.buf.rename , opts)
  vim.keymap.set("n", "<leader>bf",
  function()
    vim.lsp.buf.format({async=false, timeout_ms=10000})
  end, opts)
  vim.keymap.set("i", "<C-h>",  vim.lsp.buf.signature_help , opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
