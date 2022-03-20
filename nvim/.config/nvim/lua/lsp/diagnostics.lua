vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarning" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticInformation" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticHint" })
