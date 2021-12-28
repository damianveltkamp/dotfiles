function startServer()
  local startCommand = vim.fn.input("Server start command: ", "")

  vim.api.nvim_command('!startServer -c ' .. '"' .. startCommand .. '"')
end
