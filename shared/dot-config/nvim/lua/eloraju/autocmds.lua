-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Create templates when opening a non-existing file
vim.api.nvim_create_autocmd('BufNewFile', {
  desc = 'Insert template into new script files',
  group = vim.api.nvim_create_augroup('eloraju-insert-template-script', { clear = true }),
  pattern = { '*.py', '*.sh', '*.ts', '*.zsh' },
  callback = function(opts)
    local template_path = vim.fn.stdpath 'config' .. '/lua/eloraju/templates/scripts'
    local extension = opts.file:match '^.+%.(.+)$'
    local template = template_path .. '/' .. extension
    vim.cmd('silent 0r ' .. template)
  end,
})
