require 'eloraju.confs'
require 'eloraju.remaps'
require 'eloraju.autocmds'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'eloraju.plugins.colors',
  require 'eloraju.plugins.conform',
  require 'eloraju.plugins.gitsigns',
  require 'eloraju.plugins.harpoon',
  require 'eloraju.plugins.lspconfig',
  require 'eloraju.plugins.mini',
  require 'eloraju.plugins.nvim-cmp',
  require 'eloraju.plugins.random',
  require 'eloraju.plugins.telescope',
  require 'eloraju.plugins.treesitter',
  require 'eloraju.plugins.which-key',
  require 'eloraju.plugins.vim-tmux-navigator',
}
