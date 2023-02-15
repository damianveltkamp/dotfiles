-- local status_ok, onedark = pcall(require, "onedark")
-- if not status_ok then
-- 	return
-- end
--
-- onedark.setup({
-- 	style = "cool",
-- })
--
-- onedark.load()

-- Diagnostics
-- vim.api.nvim_command([[
-- hi DiagnosticError ctermfg=1 guifg=#e86671
-- hi DiagnosticWarn ctermfg=3 guifg=#e5c07b
-- hi DiagnosticInfo ctermfg=4 guifg=#56b6c2
-- hi DiagnosticHint ctermfg=7 guifg=#c678dd
--
-- hi DiagnosticUnderlineError cterm=underline gui=undercurl guisp=#e86671
-- hi DiagnosticUnderlineWarn cterm=underline gui=undercurl guisp=#e5c07b
-- hi DiagnosticUnderlineInfo cterm=underline gui=undercurl guisp=#61afef
-- hi DiagnosticUnderlineHint cterm=underline gui=undercurl guisp=#c678dd
--
-- hi DiagnosticVirtualTextError guifg=#000000 guibg=#e86671
-- hi DiagnosticVirtualTextWarn guifg=#93691d guibg=#333232
-- hi DiagnosticVirtualTextInfo guifg=#2b6f77 guibg=#28333B
-- hi DiagnosticVirtualTextHint guifg=#000000 guibg=#C678DD
-- ]])

-- Generic
-- vim.api.nvim_command([[
-- highlight Comment cterm=italic gui=italic
-- hi CursorLineNR guibg=#efa35d |
-- hi CursorLineNR guifg=#000000
--
-- hi LineNr guifg=#ffffff
-- hi IncSearch guibg=#efa35d
-- hi Normal guibg=NONE ctermbg=NONE
-- hi EndOfBuffer guibg=NONE ctermbg=NONE
-- ]])

-- Git signs
-- TODO refactor this when nvim provides proper highlight api
-- also add colors from global colors file
-- vim.api.nvim_command([[
--   hi GitSignsAdd guifg=#98c379
--   hi GitSignsChange guifg=#61afef
--   hi GitSidnsDelete guifg=#e06c75
-- ]])

-- onedark_colors = {
-- 	blue = "#61afef",
-- 	green = "#98c379",
-- 	purple = "#c678dd",
-- 	cyan = "#56b6c2",
-- 	red1 = "#e06c75",
-- 	red2 = "#be5046",
-- 	yellow = "#e5c07b",
-- 	fg = "#abb2bf",
-- 	bg = "#282c34",
-- 	gray1 = "#828997",
-- 	gray2 = "#2c323c",
-- 	gray3 = "#3e4452",
-- }
