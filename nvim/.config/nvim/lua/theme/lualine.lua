local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
	vim.notify("Not able to load in lualine", "error")
	return
end

-- Statusline settings
lualine.setup({
	options = {
		theme = "catppuccin",
		section_separators = { left = "", right = "" },
		icons_enabled = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", icon = "", upper = true } },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
