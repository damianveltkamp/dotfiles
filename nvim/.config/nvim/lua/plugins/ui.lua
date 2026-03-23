local rosePineColors = require 'globals/colors/rose-pine-colors'

return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        section_separators = { left = '', right = '' },
        icons_enabled = true,
        theme = {
          normal = {
            a = { fg = rosePineColors.base, bg = rosePineColors.love, gui = 'bold' },
            b = { fg = rosePineColors.text, bg = rosePineColors.overlay },
            c = { fg = rosePineColors.subtle, bg = rosePineColors.base },
          },
          insert = {
            a = { fg = rosePineColors.base, bg = rosePineColors.foam, gui = 'bold' },
            b = { fg = rosePineColors.text, bg = rosePineColors.overlay },
          },
          visual = {
            a = { fg = rosePineColors.base, bg = rosePineColors.iris, gui = 'bold' },
            b = { fg = rosePineColors.text, bg = rosePineColors.overlay },
          },
          replace = {
            a = { fg = rosePineColors.base, bg = rosePineColors.pine, gui = 'bold' },
            b = { fg = rosePineColors.text, bg = rosePineColors.overlay },
          },
          command = {
            a = { fg = rosePineColors.base, bg = rosePineColors.gold, gui = 'bold' },
            b = { fg = rosePineColors.text, bg = rosePineColors.overlay },
          },
          terminal = {
            a = { fg = rosePineColors.base, bg = rosePineColors.leaf, gui = 'bold' },
            b = { fg = rosePineColors.text, bg = rosePineColors.overlay },
            c = { fg = rosePineColors.subtle, bg = rosePineColors.base },
          },
          inactive = {
            a = { fg = rosePineColors.muted, bg = rosePineColors.base, gui = 'bold' },
            b = { fg = rosePineColors.muted, bg = rosePineColors.base },
            c = { fg = rosePineColors.muted, bg = rosePineColors.base },
          },
        },
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
      options = {
        parsers = {
          css = true,
          names = { enable = false },
          tailwind = { enable = true },
        },
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
        'NvimTreeNormal',
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
    opts = {
      sign = {
        priority = 1,
      },
    },
  },
}
