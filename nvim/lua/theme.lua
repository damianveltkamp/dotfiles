require('utils/setoptions')
require('utils/setvariable')

local command = vim.cmd
local lualine = require('lualine')

-- Statusline settings
lualine.status()
lualine.options.theme = 'wombat'

vim.api.nvim_command([[
augroup CustomColors
  autocmd ColorScheme * hi clear Cursorline |
  hi CursorLineNR guibg=#8ac6f2 |
  hi CursorLineNR guifg=#000000
  hi LineNr guifg=#ffffff

  autocmd ColorScheme * highlight QuickScopePrimary guifg='#ffffff' guibg='#ff0000' gui=underline ctermfg=155 cterm=underline

augroup END
]])

-- Gruvbox settings
setGlobalVariable('gruvbox_contrast_dark', 'hard')
setGlobalVariable('gruvbox_invert_selection', '0')
command 'colorscheme gruvbox'
setOption('global', 'background', 'dark')

-- Cursorline settings
setOption('window', 'cursorline', true)

-- Fzf window styling
setGlobalVariable('fzf_layout', {window = { width = 0.8, height = 0.8}})
