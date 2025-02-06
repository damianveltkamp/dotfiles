return {
  {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    config = function()
      local notify = require 'notify'
      notify.setup {
        merge_duplicates = true,
        timeout = 1000,
        max_width = 50,
        fps = 30,
        render = 'wrapped-compact',
      }
      vim.notify = notify
    end,
  },
}
