return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }

    local nav_opts = {
      ui_nav_wrap = true,
    }

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[A]dd current file to harpoon' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Show [H]arpoon [L]ist' })

    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev(nav_opts)
    end)

    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next(nav_opts)
    end)
  end,
}
