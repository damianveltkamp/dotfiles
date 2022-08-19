local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
	vim.notify("Not able to load in lualine", "error")
	return
end

require("theme/onedark")
require("theme/highlights/generic")
require("theme/highlights/diagnostics")
require("theme/highlights/dashboard")
require("theme/dashboard")

-- Statusline settings
lualine.setup({
	options = {
		theme = "wombat",
		component_separators = { "|", "|" },
		icons_enabled = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", icon = "", upper = true, color = { fg = "#000000", bg = "#FFA1AA" } } },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
