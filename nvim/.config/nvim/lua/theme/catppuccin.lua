local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

local catppuccinColors = require("globals/colors")

catppuccin.setup({
	flavour = "macchiato",
})

vim.api.nvim_command("colorscheme catppuccin")

-- Generic
vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.api.nvim_set_hl(0, "CursorLineNR", { fg = catppuccinColors.crust, bg = catppuccinColors.peach })
vim.api.nvim_set_hl(0, "LineNr", { fg = catppuccinColors.text })
vim.api.nvim_set_hl(0, "IncSearch", { bg = catppuccinColors.peach })

-- Git signs config
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = catppuccinColors.green })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = catppuccinColors.red })

-- Status bar config

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = catppuccinColors.red })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = catppuccinColors.red })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = catppuccinColors.crust, bg = catppuccinColors.red })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = catppuccinColors.crust, bg = catppuccinColors.mauve })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = catppuccinColors.crust, bg = catppuccinColors.yellow })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = catppuccinColors.crust, bg = catppuccinColors.green })

-- Dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = catppuccinColors.text })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = catppuccinColors.text })

-- Telescope
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = catppuccinColors.green })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = catppuccinColors.blue })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = catppuccinColors.blue })

-- Winbar
vim.api.nvim_set_hl(0, "WinBar", { fg = catppuccinColors.text })
