-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- map(mode(s), key(s), command, {desc = string, expr = bool, silent = bool, remap = bool})

-- This should also check if the file is actually runnable

local function execute_current_file(use_popup)
  local script = vim.api.nvim_buf_get_name(0)
  local has_shebang = vim.fn.readblob(script, 0, 2) == "#!"

  if not has_shebang then
    print("No shebang. Not supported yet.")
    return
  end

  if use_popup then
    vim.system({ "tmux", "display-popup", "-E", script })
  else
    vim.system({ script })
  end
end

map("n", "<leader>rr", function()
  execute_current_file(false)
end, { desc = "Run current file as script on the background" })

map("n", "<leader>rp", function()
  execute_current_file(true)
end, { desc = "Run current file as script in a tmux popup" })
