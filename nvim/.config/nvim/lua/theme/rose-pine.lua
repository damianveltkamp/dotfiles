local rosePineColors = require 'globals/colors/rose-pine-colors'

-- Generic
vim.api.nvim_set_hl(0, 'Comment', { italic = true })
vim.api.nvim_set_hl(0, 'CursorLineNR', { fg = rosePineColors.base, bg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'Visual', { fg = rosePineColors.base, bg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#303347' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#303347' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = rosePineColors.text })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = rosePineColors.base, bg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'CurSearch', { fg = rosePineColors.base, bg = rosePineColors.love })

-- Git signs config
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = rosePineColors.leaf })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = rosePineColors.pine })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = rosePineColors.love })

-- Status bar config

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = rosePineColors.gold })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = rosePineColors.pine })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = rosePineColors.iris })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = rosePineColors.gold })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = rosePineColors.gold })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = rosePineColors.iris })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = rosePineColors.base, bg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = rosePineColors.base, bg = rosePineColors.iris })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = rosePineColors.base, bg = rosePineColors.gold })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = rosePineColors.base, bg = rosePineColors.leaf })

-- Fzf
vim.api.nvim_set_hl(0, 'FzfLuaNormal', { fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'FzfLuaBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'FzfLuaTitle', { fg = rosePineColors.text })
vim.api.nvim_set_hl(0, 'FzfLuaHeaderBind', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'FzfLuaHeaderText', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'FzfLuaPathColNr', { fg = rosePineColors.pine })
vim.api.nvim_set_hl(0, 'FzfLuaPathLineNr', { fg = rosePineColors.leaf })
vim.api.nvim_set_hl(0, 'FzfLuaBufName', { fg = rosePineColors.iris })
vim.api.nvim_set_hl(0, 'FzfLuaBufNr', { fg = rosePineColors.gold })
vim.api.nvim_set_hl(0, 'FzfLuaBufFlagCur', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'FzfLuaBufFlagAlt', { fg = rosePineColors.pine })
vim.api.nvim_set_hl(0, 'FzfLuaTabTitle', { fg = rosePineColors.foam })
vim.api.nvim_set_hl(0, 'FzfLuaTabMarker', { fg = rosePineColors.gold })
vim.api.nvim_set_hl(0, 'FzfLuaLiveSym', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'FzfLuaSearch', { fg = rosePineColors.gold })

-- Mini tabline
vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = rosePineColors.love, fg = rosePineColors.base })
vim.api.nvim_set_hl(0, 'MiniTablineVisible', { fg = rosePineColors.pine })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = rosePineColors.love, fg = rosePineColors.base })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { fg = rosePineColors.love })
vim.api.nvim_set_hl(0, 'MiniTablineFill', { bg = nil })
vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = nil, fg = '#ffffff' })

-- Nvim tree
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = nil, fg = nil })
