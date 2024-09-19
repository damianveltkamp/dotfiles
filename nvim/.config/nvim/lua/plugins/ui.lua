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
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPost',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- TODO: uncomment after the breaking change has been fixed
  -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  { 'lambdalisue/nerdfont.vim', event = 'VimEnter' },
  { 'lambdalisue/glyph-palette.vim', event = 'VimEnter' },
  { 'nvim-tree/nvim-web-devicons', event = 'VimEnter' },
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
