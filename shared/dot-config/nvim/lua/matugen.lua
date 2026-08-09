 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#212337',
    base01 = '#292e42',
    base02 = '#31374f',
    base03 = '#646d8e',
    base04 = '#abb4da',
    base05 = '#ebfafa',
    base06 = '#ebfafa',
    base07 = '#ebfafa',
    base08 = '#f16c75',
    base09 = '#a48cf2',
    base0A = '#04d1f9',
    base0B = '#37f499',
    base0C = '#a48cf2',
    base0D = '#86f8c1',
    base0E = '#82e9fd',
    base0F = '#a8020d',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#ebfafa',          bg = '#212337' })
  hi('TelescopeBorder',         { fg = '#646d8e',             bg = '#212337' })
  hi('TelescopePromptNormal',   { fg = '#ebfafa',          bg = '#212337' })
  hi('TelescopePromptBorder',   { fg = '#646d8e',             bg = '#212337' })
  hi('TelescopePromptPrefix',   { fg = '#37f499',             bg = '#212337' })
  hi('TelescopePromptCounter',  { fg = '#abb4da',  bg = '#212337' })
  hi('TelescopePromptTitle',    { fg = '#212337',             bg = '#37f499' })
  hi('TelescopePreviewTitle',   { fg = '#212337',             bg = '#04d1f9' })
  hi('TelescopeResultsTitle',   { fg = '#212337',             bg = '#a48cf2' })
  hi('TelescopeSelection',      { fg = '#ebfafa',          bg = '#31374f' })
  hi('TelescopeSelectionCaret', { fg = '#37f499',             bg = '#31374f' })
  hi('TelescopeMatching',       { fg = '#37f499',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
