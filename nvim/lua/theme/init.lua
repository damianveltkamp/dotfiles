require('theme/onedark')
require('theme/start-screen')
require('utils/setoptions')
require('utils/setvariable')

local lualine = require('lualine')

-- Statusline settings
lualine.setup()

-- Enable cursorline
setOption('window', 'cursorline', true)
