local toggleterm_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status_ok then
	vim.notify("Not able to load in Toggleterm", "error")
	return
end

toggleterm.setup({
	open_mapping = [[<c-\>]],
	direction = "float",
})
