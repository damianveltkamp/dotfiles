local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
	vim.notify("Not able to load in Comment", "error")
	return
end

comment.setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
