vim.api.nvim_command([[
colorscheme onedark

highlight Comment cterm=italic gui=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

hi CursorLineNR guibg=#8ac6f2 |
hi CursorLineNR guifg=#000000

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
]])
