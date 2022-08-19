local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
	vim.notify("Not able to load in notify", "error")
	return
end

notify.setup({
	timeout = 1000,
	max_width = 50,
	fps = 30,
})

vim.notify = notify
