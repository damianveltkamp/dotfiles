local tsAutotag_status_ok, tsAutotag = pcall(require, "nvim-ts-autotag")
if not tsAutotag_status_ok then
	vim.notify("Not able to load in nvim-ts-autotag", "error")
	return
end

tsAutotag.setup()
