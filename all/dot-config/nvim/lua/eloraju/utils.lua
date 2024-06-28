local split_helper = function(input)
  if input == 'h' then
    return function()
      vim.o.splitright = false
      vim.cmd 'vsplit'
    end
  elseif input == 'j' then
    return function()
      vim.o.splitbelow = true
      vim.cmd 'split'
    end
  elseif input == 'k' then
    return function()
      vim.o.splitbelow = false
      vim.cmd 'split'
    end
  elseif input == 'l' then
    return function()
      vim.o.splitright = true
      vim.cmd 'vsplit'
    end
  end
end

return {
  split = split_helper,
}
