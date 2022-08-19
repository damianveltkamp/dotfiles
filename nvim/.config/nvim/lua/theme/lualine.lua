local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
	vim.notify("Not able to load in lualine", "error")
	return
end

local lualine_onedark_status_ok, lualine_onedark = pcall(require, "lualine.themes.onedark")
if not lualine_onedark_status_ok then
	vim.notify("Not able to load in lualine_onedark theme", "error")
	return
end

lualine_onedark.normal.a.bg = personal_colors.DVOrange
lualine_onedark.visual.a.bg = onedark_colors.green

-- Statusline settings
lualine.setup({
	options = {
		theme = lualine_onedark,
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
