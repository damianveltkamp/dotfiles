local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
	vim.notify("Not able to load in colorizer", "error")
	return
end

colorizer.setup()
