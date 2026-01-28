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
        names = false,
      },
    },
  },
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
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    ft = 'markdown',
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
