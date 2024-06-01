return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          ['<C-k>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
          ['<C-j>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
          ['<CR>'] = cmp.mapping.confirm({select = true}),
        }),
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        if client.name == "eslint" then
          vim.cmd.LspStop("eslint")
        end

        vim.keymap.set("n", "gd",  vim.lsp.buf.definition , opts)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover , opts)
        vim.keymap.set("n", "<leader>kh",  vim.lsp.buf.signature_help , opts)
        vim.keymap.set("n", "<leader>kss",  vim.lsp.buf.workspace_symbol , opts)
        vim.keymap.set("n", "<leader>kd",  vim.diagnostic.open_float , opts)
        vim.keymap.set("n", "<leader>dn",  vim.diagnostic.goto_next , opts)
        vim.keymap.set("n", "<leader>dp",  vim.diagnostic.goto_prev , opts)
        vim.keymap.set("n", "<leader>ka",  vim.lsp.buf.code_action , opts)
        vim.keymap.set("n", "<leader>kr",  vim.lsp.buf.references , opts)
        vim.keymap.set("n", "<leader>kn",  vim.lsp.buf.rename , opts)
        vim.keymap.set("n", "<leader>bf",
        function()
          vim.lsp.buf.format({async=false, timeout_ms=10000})
        end, opts)
        vim.keymap.set("i", "<C-h>",  vim.lsp.buf.signature_help , opts)
      end)

      vim.diagnostic.config({
        virtual_text = true
      })
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      -- lsp_zero.default_keymaps({buffer = bufnr})
      require('mason-lspconfig').setup({
        ensure_installed = {
          "tsserver",
          "lua_ls",
          "rust_analyzer"
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end,
  }
}
