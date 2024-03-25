-- https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-behavior

vim.api.nvim_create_user_command('DVSearchMDNCss', function()
  local word = vim.fn.expand '<cword>'
  local cssVar = word:gsub('(%S)(%u)', '%1-%2'):lower()
  local MDNUrl = 'https://developer.mozilla.org/en-US/docs/Web/CSS/' .. cssVar

  local executionString = 'open -a "Google chrome" ' .. MDNUrl
  os.execute(executionString)
end, {})
