return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function() vim.cmd 'colorscheme rose-pine-moon' end,
  },
  -- {
  --   'catppuccin/nvim',
  --   event = 'BufReadPost',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   opts = {
  --     flavour = 'macchiato',
  --     integrations = {
  --       notify = true,
  --     },
  --     transparent_background = true,
  --     dim_inactive = {
  --       enabled = true, -- dims the background color of inactive window
  --       shade = 'light',
  --       percentage = 0.5, -- percentage of the shade to apply to the inactive window
  --     },
  --   },
  -- },
}
