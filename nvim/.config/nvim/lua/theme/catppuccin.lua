local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavour = "macchiato",
})

vim.api.nvim_command("colorscheme catppuccin")

-- Generic
vim.api.nvim_command([[
highlight Comment cterm=italic gui=italic
hi CursorLineNR guibg=#f5a97f |
hi CursorLineNR guifg=#181926

hi LineNr guifg=#cad3f5
hi IncSearch guibg=#f5a97f
]])

-- Git signs config
vim.api.nvim_command([[
  hi GitSignsAdd guifg=#a6da95
  hi GitSignsChange guifg=#8aadf4
  hi GitSidnsDelete guifg=#ed8796
]])

-- Status bar config

-- Diagnostics
vim.api.nvim_command([[
hi DiagnosticError ctermfg=1 guifg=#ed8796
hi DiagnosticWarn ctermfg=3 guifg=#eed49f
hi DiagnosticInfo ctermfg=4 guifg=#8aadf4
hi DiagnosticHint ctermfg=7 guifg=#c6a0f6

hi DiagnosticUnderlineError cterm=underline gui=undercurl guisp=#ed8796
hi DiagnosticUnderlineWarn cterm=underline gui=undercurl guisp=#eed49f
hi DiagnosticUnderlineInfo cterm=underline gui=undercurl guisp=#8aadf4
hi DiagnosticUnderlineHint cterm=underline gui=undercurl guisp=#c6a0f6

hi DiagnosticVirtualTextError guifg=#181926 guibg=#ed8796
hi DiagnosticVirtualTextWarn guifg=#93691d guibg=#333232
hi DiagnosticVirtualTextInfo guifg=#2b6f77 guibg=#28333B
hi DiagnosticVirtualTextHint guifg=#181926 guibg=#c6a0f6
]])

-- Dashboard
vim.api.nvim_command([[
  hi DashboardHeader guifg=#8aadf4
  hi DashboardCenter guifg=#cad3f5
  hi DashboardFooter guifg=#cad3f5
]])

-- Telescope
vim.api.nvim_command([[
hi TelescopeSelection guifg=#ffffff gui=bold
hi TelescopeMatching guifg=#a6da95
hi TelescopeBorder         guifg=#8aadf4
hi TelescopePromptBorder   guifg=#8aadf4
hi TelescopeResultsBorder  guifg=#8aadf4
hi TelescopePreviewBorder  guifg=#8aadf4
]])

-- Winbar
vim.api.nvim_command([[
hi WinBar guifg=#cad3f5
]])
