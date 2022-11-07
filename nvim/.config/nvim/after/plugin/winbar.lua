vim.api.nvim_set_hl(0, "WinBarFilename", { fg = "#181926", bg = "#8aadf4" })
vim.api.nvim_set_hl(0, "WinBarModified", { fg = "#181926", bg = "#f5a97f" })

winbar_filetype_exclude = {
	"help",
	"dashboard",
	"packer",
	"Trouble",
	"toggleterm",
	"fugitive",
	"NvimTree",
}

local excludes = function()
	if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

function get_winbar()
	if excludes() then
		return ""
	end

	return "%#WinBarFilename#" .. "%f" .. "%*" .. "%#WinBarModified#" .. "%m" .. "%*"
end

local opt = vim.opt

opt.winbar = "%{%v:lua.get_winbar()%}"
