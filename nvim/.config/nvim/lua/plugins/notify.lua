return {
  {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    config = function()
      require('notify').setup {
        timeout = 1000,
        max_width = 50,
        fps = 30,
      }
      vim.notify = require 'notify'
    end,
  },
}
