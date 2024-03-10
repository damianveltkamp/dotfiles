return {
	"jxnblk/vim-mdx-js",
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown", "markdown.mdx", "pandoc" }
		end,
		ft = { "markdown" },
	},
}
