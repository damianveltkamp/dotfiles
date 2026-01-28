return {
  {
    'nvim-mini/mini.nvim',
    event = 'BufReadPost',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.tabline').setup {}
      require('mini.splitjoin').setup {}
    end,
  },
}
