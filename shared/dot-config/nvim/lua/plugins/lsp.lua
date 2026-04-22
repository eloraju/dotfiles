return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    ui = {
      windows = {
        default_options = {
          border = "rounded",
        },
      },
    },
    servers = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { vim },
          },
        },
      },
    },
  },
}
