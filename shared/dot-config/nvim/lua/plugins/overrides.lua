return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ui = {
        windows = {
          default_options = {
            border = "rounded",
          },
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "buffer", "path" },
      },
    },
  },
}
