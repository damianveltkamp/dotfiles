return {
  {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    config = function()
      local notify = require 'notify'
      notify.setup {
        timeout = 1000,
        max_width = 500,
        fps = 30,
      }
      vim.notify = notify
    end,
  },
}
