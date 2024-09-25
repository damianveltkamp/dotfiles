return {
  {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    opts = {
      timeout = 1000,
      max_width = 50,
      fps = 30,
    },
    config = function()
      vim.notify = require 'notify'
    end,
  },
}
