return {
  {
    'catppuccin/nvim',
    event = 'BufReadPost',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'macchiato',
      integrations = {
        notify = true,
      },
    },
  },
}
