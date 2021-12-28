vim.api.nvim_command([[
hi DiagnosticError ctermfg=1 guifg=#e86671
hi DiagnosticWarn ctermfg=3 guifg=#e5c07b
hi DiagnosticInfo ctermfg=4 guifg=#56b6c2
hi DiagnosticHint ctermfg=7 guifg=#c678dd

hi DiagnosticUnderlineError cterm=underline gui=undercurl guisp=#e86671
hi DiagnosticUnderlineWarn cterm=underline gui=undercurl guisp=#e5c07b
hi DiagnosticUnderlineInfo cterm=underline gui=undercurl guisp=#61afef
hi DiagnosticUnderlineHint cterm=underline gui=undercurl guisp=#c678dd

hi DiagnosticVirtualTextError guifg=#000000 guibg=#e86671
hi DiagnosticVirtualTextWarn guifg=#93691d guibg=#333232
hi DiagnosticVirtualTextInfo guifg=#2b6f77 guibg=#28333B
hi DiagnosticVirtualTextHint guifg=#000000 guibg=#C678DD
]])
