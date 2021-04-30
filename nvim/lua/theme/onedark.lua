require('utils/setvariable')

setGlobalVariable('onedark_hide_endofbuffer', 1)
setGlobalVariable('onedark_terminal_italics', 1)
setGlobalVariable('onedark_termcolors', 1)
-- TODO Set global function
vim.api.nvim_command([[
colorscheme onedark

highlight Comment cterm=italic gui=italic

hi CursorLineNR guibg=#8ac6f2 |
hi CursorLineNR guifg=#000000

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
]])
