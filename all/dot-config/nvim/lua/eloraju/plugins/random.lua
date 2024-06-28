return {
  -- brakes with #!/usr/bin/env zsh
  --'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'numToStr/Comment.nvim', opts = {} },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'HiPhish/rainbow-delimiters.nvim', -- Highlight matching delimiters
}
