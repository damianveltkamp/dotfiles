return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'ibhagwan/fzf-lua',
    },
    config = true,
    event = 'VeryLazy',
  },
}
