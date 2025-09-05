local catppuccinColors = require 'globals/colors'

vim.api.nvim_command 'colorscheme catppuccin'

-- Generic
vim.api.nvim_set_hl(0, 'Comment', { italic = true })
vim.api.nvim_set_hl(0, 'CursorLineNR', { fg = catppuccinColors.crust, bg = catppuccinColors.peach })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#303347' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#303347' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = catppuccinColors.text })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = catppuccinColors.peach })

-- Git signs config
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = catppuccinColors.green })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = catppuccinColors.red })

-- Status bar config

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = catppuccinColors.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = catppuccinColors.red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = catppuccinColors.crust, bg = catppuccinColors.red })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = catppuccinColors.crust, bg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = catppuccinColors.crust, bg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = catppuccinColors.crust, bg = catppuccinColors.green })

-- Fzf
vim.api.nvim_set_hl(0, 'FzfLuaNormal', { fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'FzfLuaBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'FzfLuaTitle', { fg = catppuccinColors.text })
vim.api.nvim_set_hl(0, 'FzfLuaHeaderBind', { fg = catppuccinColors.peach })
vim.api.nvim_set_hl(0, 'FzfLuaHeaderText', { fg = catppuccinColors.peach })
vim.api.nvim_set_hl(0, 'FzfLuaPathColNr', { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, 'FzfLuaPathLineNr', { fg = catppuccinColors.green })
vim.api.nvim_set_hl(0, 'FzfLuaBufName', { fg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, 'FzfLuaBufNr', { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, 'FzfLuaBufFlagCur', { fg = catppuccinColors.peach })
vim.api.nvim_set_hl(0, 'FzfLuaBufFlagAlt', { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, 'FzfLuaTabTitle', { fg = catppuccinColors.sky })
vim.api.nvim_set_hl(0, 'FzfLuaTabMarker', { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, 'FzfLuaLiveSym', { fg = catppuccinColors.peach })
vim.api.nvim_set_hl(0, 'FzfLuaSearch', { fg = catppuccinColors.yellow })

-- Mini tabline
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = catppuccinColors.peach, fg = catppuccinColors.crust })
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = catppuccinColors.peach, fg = catppuccinColors.crust })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { fg = catppuccinColors.red })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { fg = catppuccinColors.red })
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = nil })
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = nil, fg = '#ffffff' })

-- Nvim tree
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = nil, fg = nil })

vim.api.nvim_set_hl(0, 'LspInlayHint', { bg = '#ff0000', fg = '#ff0000' })
