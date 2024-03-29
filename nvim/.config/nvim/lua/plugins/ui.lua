return {
  {
    'hoob3rt/lualine.nvim',
    opts = {
      options = {
        theme = 'catppuccin',
        section_separators = { left = '', right = '' },
        icons_enabled = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', upper = true } },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
    event = 'VimEnter',
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPost',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    main = 'ibl',
    opts = { scope = { enabled = false } },
  },
  { 'lambdalisue/nerdfont.vim', event = 'VimEnter' },
  { 'lambdalisue/glyph-palette.vim', event = 'VimEnter' },
  { 'kyazdani42/nvim-web-devicons', event = 'VimEnter' },
  {
    'xiyaowong/transparent.nvim',
    event = 'VimEnter',
    opts = {
      extra_groups = {
        'NvimTreeNormal', -- NvimTree
        'CursorColumn',
      },
      exclude_groups = {
        'CursorLineNr',
      },
    },
  },
}
