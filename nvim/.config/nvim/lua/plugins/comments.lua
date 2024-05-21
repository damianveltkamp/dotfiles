return {
  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'BufReadPost',
    enabled = vim.fn.has 'nvim-0.10.0' == 1,
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufReadPost',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
