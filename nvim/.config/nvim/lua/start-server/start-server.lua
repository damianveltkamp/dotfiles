function startServer()
  local packageManager = vim.fn.input("Package manager: ", "")
  local startCommand = vim.fn.input("Server start command: ", "")

   vim.api.nvim_command('!startServer -p ' .. packageManager .. ' -c ' .. startCommand)
end
