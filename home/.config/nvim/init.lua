require 'confs'
require 'remaps'
require 'autocmds'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.colors',
  require 'plugins.conform',
  require 'plugins.gitsigns',
  require 'plugins.harpoon',
  require 'plugins.lspconfig',
  require 'plugins.mini',
  require 'plugins.nvim-cmp',
  require 'plugins.random',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.which-key',
}
