
return {
  {
    "nvim-mini/mini.nvim",
    version = '*',
    config = function()
      require("mini.ai").setup({})
      require("mini.icons").setup({})
      require("mini.surround").setup({})
      require("mini.move").setup({})
    end
  },
}
