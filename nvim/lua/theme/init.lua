require('theme/onedark')
require('theme/start-screen')
require('utils/setoptions')
require('utils/setvariable')

local command = vim.cmd
local lualine = require('lualine')

-- Statusline settings
lualine.status()
lualine.options.theme = 'wombat'

-- Custom collors for quickscope and cursorlines
setOption('window', 'cursorline', true)

vim.api.nvim_command([[
augroup CustomColors
  autocmd ColorScheme * hi clear Cursorline |
  hi CursorLineNR guibg=#8ac6f2 |
  hi CursorLineNR guifg=#000000
  hi LineNr guifg=#ffffff

  autocmd ColorScheme * highlight QuickScopePrimary guifg='#ffffff' guibg='#ff0000' gui=underline ctermfg=155 cterm=underline

augroup END
]])

-- Fzf window styling
setGlobalVariable('fzf_layout', {window = { width = 0.8, height = 0.8}})
