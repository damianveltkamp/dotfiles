local indent_blankline_status_ok, indent_blankline = pcall(require, "ibl")
if not indent_blankline_status_ok then
	vim.notify("Not able to load in colorizer", "error")
	return
end

indent_blankline.setup({})
