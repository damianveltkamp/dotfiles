local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	highlight = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	ensure_installed = {
		"typescript",
		"tsx",
		"javascript",
		"lua",
		"html",
		"json",
		"scss",
		"css",
	},
})
