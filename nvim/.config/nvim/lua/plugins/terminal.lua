return {
  {
    'akinsho/toggleterm.nvim',
    keys = { '<c-\\>' },
    cmd = { 'TermExec' },
    version = '*',
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      direction = 'float',
      shading_factor = 0,
      float_opts = { border = 'curved' },
    },
  },
}
