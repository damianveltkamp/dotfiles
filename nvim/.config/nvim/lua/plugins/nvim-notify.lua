local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
  vim.notify("Not able to load in notify", "error")
  return
end

notify.setup({
  max_width = 50,
  max_height = 10,
  minimum_width = 50,
})

vim.notify = notify
