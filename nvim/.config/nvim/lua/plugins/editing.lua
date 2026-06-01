return {
  { 'tpope/vim-surround', event = 'BufReadPost' },
  { 'unblevable/quick-scope', event = 'BufReadPost' },
  { 'mbbill/undotree', cmd = { 'UndotreeToggle' } },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter', opts = {} },
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
