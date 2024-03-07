local lint_status_ok, lint = pcall(require, "lint")
if not lint_status_ok then
	return
end

lint.linters_by_ft = {
	javascript = {
		"eslint",
	},
	typescript = {
		"eslint",
	},
	javascriptreact = {
		"eslint",
	},
	typescriptreact = {
		"eslint",
	},
}
