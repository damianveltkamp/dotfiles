require('theme/onedark')
require('theme/start-screen')
require('utils/setoptions')
require('utils/setvariable')

-- Statusline settings
require('lualine').setup{
  options = {
    theme = 'wombat',
    component_separators = {'|', '|'},
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{'branch', icon = '', upper = true, color = {fg = '#000000', bg = '#FFA1AA'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

-- Enable cursorline
setOption('window', 'cursorline', true)
