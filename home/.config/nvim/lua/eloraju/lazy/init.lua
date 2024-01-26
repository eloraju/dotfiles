function SetColors(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
end

return {
  {
    'nvim-lua/plenary.nvim',
    name = 'plenary'
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      SetColors()
    end
  },
}

