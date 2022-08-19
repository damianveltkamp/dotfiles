local indent_blankline_status_ok, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_status_ok then
	vim.notify("Not able to load in colorizer", "error")
	return
end

indent_blankline.setup({
	show_end_of_line = true,
})
