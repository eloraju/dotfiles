vim.api.nvim_create_user_command("ChmodX", function()
  local file = vim.fn.expand("%")

  if file == "" then
    vim.notify("No file in buffer", vim.log.levels.WARN)
    return
  end

  local result = vim.fn.system("chmod +x " .. vim.fn.shellescape(file))

  if vim.v.shell_error ~= 0 then
    vim.notify("chmod failed: " .. result, vim.log.levels.ERROR)
  else
    vim.notify("Made executable: " .. file, vim.log.levels.INFO)
  end
end, { desc = "Make current file executable" })

vim.api.nvim_create_user_command("ReloadConf", function()
  local conf_path = vim.cmd("echo stdpath('config')")
  vim.cmd(string.format("source %s", conf_path))
  vim.notify("Config reloaded", vim.log.levels.INFO)
end, {})
